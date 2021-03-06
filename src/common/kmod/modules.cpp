#include <kmod/modules.h>
#include <elf/elfldr.h>
#include <map.h>
#include <paging/paging.h>
#include <kernio/kernio.h>
#include <vfs/vfs.h>
#include <kapi/kapi.h>

namespace kmod {
    map<string,KModule_t> modules;

    void init() {
        modules = map<string, KModule_t>();
        kapi::init();
    }

    bool load(char* path) {
        stream_t s = vfs::getStream(path);
        char* buf = (char*)malloc(s.slen);
        stream::read(s, buf, s.slen);
        stream::close(s);
        ELFExec mod((uint32_t)buf);

        uint32_t end = 0;
        vector<ELFSection_t> sect = mod.getSections();
        for (int i = 0; i < sect.size(); i++) {
            if (sect[i].addr + sect[i].size > end) {
                end = sect[i].addr + sect[i].size;
            }
        }

        // Allocate pages
        char* loadAddr = (char*)paging::allocPages((end / 4096) + 1);

        // Load sections
        for (int i = 0; i < sect.size(); i++) {
            if (sect[i].flags & ELF_SHF_ALLOC) {
                memcpy(sect[i].addr + loadAddr, sect[i].data, sect[i].size);
            }
        }

        uint32_t entryPtr = 0;

        vector<ELFSymbol_t> syms = mod.getSymbols();
        for (int i = 0; i < syms.size(); i++) {
            if (strcmp(syms[i].name, "_start")) {
                entryPtr = syms[i].addr + (uint32_t)loadAddr;
            }
        }

        if (entryPtr == 0) {
            return false;
        }

        bool (*func_ptr)(KAPI_t) = (bool (*)(KAPI_t))(entryPtr);

        kio::printf("print_addr = 0x%X", kapi::api.kio.print);

        bool ret = func_ptr(kapi::api);
        if (ret == true) {
            // TODO: Save module
        }
        return ret;
    }
    
    bool unload(char* name) {
        return false;
    }
}