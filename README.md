# Configuration NixOS

## Hosts

Il existe deux hosts...

### Clover

### Sam

## Modules

### NixOS

#### Système

**Core**

Activer l'optimisation automatique du store :

> `customOpts.core.optimise = true;`

Installer Nix Helper :

> `customOpts.core.nh.enable = true;`

Activer l'optimisation automatique du store via Nix Helper :

> `customOpts.core.nh.optimise = true;`

**Bootloader Limine**

Activer le bootloader Limine (nécéssaire pour activer les options qui suivent) :

>`customOpts.boot.limine.enable = true;`

Deux options facultatives existent, une pour le branding (le texte affiché en haut lors du choix du boot entry) et une pour la résolution de l'écran de boot :

> `customOpts.boot.limine.branding = "str";`  
> Default: "LIMINE BOOTLOADER"  
> `customOpts.boot.limine.resolution = "str"`  
> Default: "1920x1080"

Activer le dualboot windows :

> `customOpts.boot.limine.dualboot.enable = true;`  
> `customOpts.boot.limine.dualboot.path = "str";`  
> Default: "boot()"

==Attention==: Si les fichiers de boot de Limine et Windows sont installés dans la même partition EFI, alors le path est `"boot()"`, sinon trouver l'UUID de la partition EFI de Windows avec `lsblk -f` et remplacer l'option de path par :

> `customOpts.boot.limine.dualboot.path = "uuid([UUID DE LA PARTITION])"`  
> Exemple: `customOpts.boot.limine.dualboot.path = "uuid(3803-8C56)"`

Activer le Secure Boot avec Limine:

> `customOpts.boot.limine.secureboot.enable = true;`

==Attention==: Une fois activé, il faut aller dans le BIOS et mettre le Secure Boot en mode "Setup Mode" ou équivalent (reset/erase des clés existantes) pour que Limine génère de nouvelle clés. On peut ensuite voir le status du Secure Boot avec `sbctl status` ou `bootctl status`.

**Desktop Environment**

Activer GNOME :

> `customOpts.de.gnome.enable = true;`

Il existe une version "minimal" qui n'installe pas les applications fournies par défaut avec GNOME :

> `customOpts.de.gnome.minimal = true;`

Activer COSMIC :

> `customOpts.de.cosmic.enable = true;`

**Services**

Activer l'impression :

> `customOpts.services.printing.enable = true;`

#### Hardware

**AMD**

Le matériel AMD devrait être supporté automatiquement. Pour activer le support de l'accélération matérielle :

> `customOpts.hardware.gpu.hardwareAccelerationSupport = true;`

### Home-Manager




