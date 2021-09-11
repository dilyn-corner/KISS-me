/* See LICENSE file for copyright and license details. */
struct rule {
    const char *devregex;
    const char *user;
    const char *group;
    int mode;
    const char *path;
    const char *cmd;
} rules[] = {
    //tty
    { "console",       "root", "tty",   0600, NULL,      NULL               },
    { "pty.*",         "root", "tty",   0660, NULL,      NULL               },
    { "ptmx",          "root", "tty",   0666, NULL,      NULL               },
    { "tty",           "root", "tty",   0666, NULL,      NULL               },
    { "tty[0-9]",      "root", "tty",   0600, NULL,      NULL               },
    { "tty[0-9][0-9]", "root", "tty",   0660, NULL,      NULL               },
    { "vcs*[0-9].*",   "root", "tty",   0660, NULL,      NULL               },
    // serial
    { "tty.*",         "root", "uucp",  0660, NULL,      NULL               },
    { "slamr",         "root", "tty",   0660, NULL,      NULL               },
    { "slusb",         "root", "tty",   0660, NULL,      NULL               },
    { "vport.*",       "root", "root",  0660, NULL,      NULL               },
    { "ircomm[0-9].*", "root", "uucp",  0660, NULL,      NULL               },
    { "noz[0-9].*",    "root", "uucp",  0660, NULL,      NULL               },
    { "rfcomm[0-9].*", "root", "uucp",  0660, NULL,      NULL               },
    { "mwave",         "root", "uucp",  0660, NULL,      NULL               },
    { "hvc.*",         "root", "uucp",  0660, NULL,      NULL               },
    { "hvi.*",         "root", "uucp",  0660, NULL,      NULL               },
    { "ppox[0-9].*",   "root", "uucp",  0660, NULL,      NULL               },
    // mem
    { "null",          "root", "root",  0666, NULL,      NULL               },
    { "zero",          "root", "root",  0666, NULL,      NULL               },
    { "full",          "root", "root",  0666, NULL,      NULL               },
    { "random",        "root", "root",  0666, NULL,      NULL               },
    { "urandom",       "root", "root",  0444, NULL,      NULL               },
    { "hwrandom",      "root", "root",  0660, NULL,      NULL               },
    { "hw_random",     "root", "root",  0660, "=hwrng",  NULL               },
    { "grsec",         "root", "root",  0660, NULL,      NULL               },
    { "mem",           "root", "kmem",  0640, NULL,      NULL               },
    { "kmem",          "root", "kmem",  0640, NULL,      NULL               },
    { "port",          "root", "kmem",  0640, NULL,      NULL               },
    { "nvram",         "root", "kmem",  0640, NULL,      NULL               },
    // input
    { "input/.*",      "root", "input", 0660, "=input/", "@/usr/bin/helper" },
    { "ts[0-9].+",     "root", "root",  0640, "=input/", "@/usr/bin/helper" },
    // graphics
    { "video.*",       "root", "video", 0660, NULL,      "@/usr/bin/helper" },
    { "vchiq",         "root", "video", 0660, NULL,      NULL               },
    { "vbi[0-9]",      "root", "video", 0660, NULL,      NULL               },
    { "cec[0-9]",      "root", "video", 0660, NULL,      NULL               },
    { "agpgart",       "root", "video", 0660, NULL,      NULL               },
    { "pmu",           "root", "video", 0660, NULL,      NULL               },
    { "fb[0-9].*",     "root", "video", 0660, NULL,      NULL               },
    // dri
    { "dri/.*",        "root", "video", 0660, "=dri/",   "@/usr/bin/helper" },
    { "card[0-9].*",   "root", "video", 0660, "=dri/",   "@/usr/bin/helper" },
    // usb
    { "bus/usb/.*",    "root",  "usb",   0664, NULL,      "@/usr/bin/helper" },
    // printer
    { "partport[0-9].*","root", "lp",    0660, NULL,      "@/usr/bin/helper" },
    { "partport_pc",    "root", "lp",    0660, NULL,      "@/usr/bin/helper" },
    { "usb/lp[0-9].*",  "root", "lp",    0660, "=usb/",   "@/usr/bin/helper" },
    { "lp[0-9]*",       "root", "lp",    0660, NULL,      "@/usr/bin/helper" },
    { "irlpt[0-9].*",   "root"," lp",    0660, NULL,      "@/usr/bin/helper" },
    // block
    { "sd[a-z].*",      "root", "disk",  0660, NULL,      NULL               },
    { "hd[a-z].*",      "root", "disk",  0660, NULL,      NULL               },
    { "ram[0-9].*",     "root", "disk",  0660, NULL,      NULL               },
    { "loop[0-9].*",    "root", "disk",  0660, NULL,      NULL               },
    { "control",        "root", "disk",  0660, NULL,      NULL               },
    { "mmcblk[0-9].*",  "root", "disk",  0660, NULL,      NULL               },
    { "md.*",           "root", "disk",  0660, NULL,      NULL               },
    { "mtd.*",          "root", "disk",  0660, NULL,      NULL               },
    { "ndb.*",          "root", "disk",  0660, NULL,      NULL               },
    { "gnbd.*",         "root", "disk",  0660, NULL,      NULL               },
    { "btibm.*",        "root", "disk",  0660, NULL,      NULL               },
    { "dm-.*",          "root", "disk",  0660, NULL,      NULL               },
    { "vd.*",           "root", "disk",  0660, NULL,      NULL               },
    { "sg.*",           "root", "disk",  0660, NULL,      NULL               },
    { "sr[0-9].*",      "root", "cdrom", 0660, NULL,      NULL               },//"@ln -sf $DEVNAME /dev/cdrom"
    { "fd[0-9].*",      "root", "disk",  0660, NULL,      NULL               },
    // tape
    { "ht[0-9].*",      "root", "tape",  0660, NULL,      NULL               },
    { "nht[0-9].*",     "root", "tape",  0660, NULL,      NULL               },
    { "pt[0-9].*",      "root", "tape",  0660, NULL,      NULL               },
    { "npt[0-9].*",     "root", "tape",  0660, NULL,      NULL               },
    { "pht[0-9].*",     "root", "tape",  0660, NULL,      NULL               },
    { "st*[0-9].*",     "root", "tape",  0660, NULL,      NULL               },
    { "nst*[0-9].*",    "root", "tape",  0660, NULL,      NULL               },
    //block-related
    { "btrfs-control",  "root", "root",  0600, NULL,      NULL               },
    { "loop-control",   "root", "disk",  0660, NULL,      NULL               },
    { "mapper/.*",      "root", "root",  0600, "=mapper/",NULL               },
    { "scsi.*/.*",      "root", "disk",  0660, NULL,      NULL               },
    { "bdi.*/.*",       "root", "disk",  0660, NULL,      NULL               },
    { "sch[0-9].*",     "root", "disk",  0660, NULL,      NULL               },
    { "pg[0-9].*",      "root", "disk",  0660, NULL,      NULL               },
    { "qft[0-9].*",     "root", "disk",  0660, NULL,      NULL               },
    { "nqft[0-9].*",    "root", "disk",  0660, NULL,      NULL               },
    { "zqft[0-9].*",    "root", "disk",  0660, NULL,      NULL               },
    { "nzqft[0-9].*",   "root", "disk",  0660, NULL,      NULL               },
    { "rawqft[0-9].*",  "root", "disk",  0660, NULL,      NULL               },
    { "nrawqft[0-9].*", "root", "disk",  0660, NULL,      NULL               },
    { "raw[0-9].*",     "root", "disk",  0660, "=raw/",   NULL               },
    { "rawctl",         "root", "disk",  0660, "=raw/",   NULL               },
    { "aoe.*",          "root", "disk",  0660, "=etherd/",NULL               },
    { "bsg/.*",         "root", "disk",  0660, "=bsg/",   NULL               },
    // audio
    { "snd/.*",         "root", "audio", 0660, "=snd/",   NULL               },
    { "midi.*",         "root", "audio", 0660, "=snd/",   NULL               },
    { "seq",            "root", "audio", 0660, "=snd/",   NULL               },
    { "timer",          "root", "audio", 0660, "=snd/",   NULL               },
    { "hpet",           "root", "audio", 0660, "=snd/",   NULL               },
    { "adsp",           "root", "audio", 0660, "=snd/",   NULL               },
    { "audio",          "root", "audio", 0660, "=snd/",   NULL               },
    { "dsp",            "root", "audio", 0660, "=snd/",   NULL               },
    { "mixer",          "root", "audio", 0660, "=snd/",   NULL               },
    { "sequencer.*",    "root", "audio", 0660, "=snd/",   NULL               },
    { "timer",          "root", "audio", 0660, "=snd/",   NULL               },
    { "pcm.*",          "root", "audio", 0660, "=snd/",   NULL               },
    // network
    { "-net/.*",        "root", "network",  0660, NULL,      "@nameif"       },
    { "tun",            "root", "network",  0666, "=net/",   NULL            },
    { "tun[0-9].*",     "root", "network",  0660, "=net/",   NULL            },
    { "tap[0-9].*",     "root", "network",  0660, "=net/",   NULL            },
    { "rfkill",         "root", "rfkill",   0640, NULL,      NULL            },
    // cpu
    { "cpu([0-9].+)",   "root", "root",  0444, "=cpu/%1/cpuid", NULL         },
    { "msr([0-9].+)",   "root", "root",  0600, "=cpu/%1/msr",   NULL         },
    { "microcode",      "root", "root",  0600, "=cpu/microcode",NULL         },
    // fuse
    { "fuse",           "root", "root",  0666, NULL,      NULL },
    // raid controllers
    { "cciss.*",        "root", "disk",  0660, NULL,      NULL               },
    { "ida.*",          "root", "disk",  0660, NULL,      NULL               },
    { "rd.*",           "root", "disk",  0660, NULL,      NULL               },
    // misc
    { "ppp",            "root", "root",  0000, NULL,      NULL               },
    { "kvm",            "root", "kvm",   0660, NULL,      NULL               },
    { "vhost-net",      "root", "kvm",   0666, NULL,      NULL               },
    { "vhost-vsock",    "root", "kvm",   0666, NULL,      NULL               },
    { "psaux",          "root", "root",  0660, NULL,      NULL               },
    { "rtc",            "root", "root",  0660, NULL,      NULL               },
    { "rtc[0-9]*",      "root", "root",  0664, NULL,      NULL               },
    { "mmtimer",        "root", "root",  0644, NULL,      NULL               },
    { "rflash[0-9]*",   "root", "root",  0400, NULL,      NULL               },
    { "rrom[0-9]*",     "root", "root",  0400, NULL,      NULL               },
    { "auer[0-9]*",     "root", "root",  0660, "=usb/",   NULL               },
    { "sxctl",          "root", "root",  0660, "=specialix_sxctl/",   NULL   },
    { "rioctl",         "root", "root",  0660, "=specialix_rioctl/",  NULL   },
    //arch
    { "sgi_.*",         "root", "root",  0666, NULL,      NULL               },
    { "iseries/ibmsis.*","root","disk",  0660, NULL,      NULL               },
    { "iseries/nvt.*",  "root", "disk",  0660, NULL,      NULL               },
    { "iseries/vt.*",   "root", "disk",  0660, NULL,      NULL               },
    { "iseries/vtty.*", "root", "disk",  0660, NULL,      NULL               },

    { ".*",             "root", "root",  0660, NULL,      "@/usr/bin/helper" },
};

/* Fill into this table if you want to rename the network interface
 * identified by `mac' to `name'.  By default no such renaming takes
 * place.
 */
struct mac2name {
    unsigned char mac[6];
    const char *name;
} mac2names[] = {
    { .mac = { 0 }, .name = NULL }
};
