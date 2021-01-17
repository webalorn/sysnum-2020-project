# Projet de sysnum

*Ce projet est disponible sur [github](https://github.com/webalorn/sysnum-2020-project)*

**Note :** *ce projet simule un RISC-V. La plupart des programmes sont donc écrits en C++ et compilés vers de l'assembleur par clang, et j'utilise ensuite mon propre programme pour le transformer en code binaire qui sera exécuté par mon processeur. Il faut cependant disposer d'une installation de `clang` supportant la cible `riscv32` pour générer le code assembleur (ce qui ne semble pas le cas partout, j'ai dû utiliser une VM Linux pour cela). Ainsi le code assembleur est directement fourni et n'est **pas** généré par les commandes de build. Cependant, il peut très bien être régénéré en utilisant `make -C code`.*

## Quickstart

```bash
make clock
# Lancer l'horloge
netsim/runclock code/build/clock.risc
# Version rapide ignorant les ticks
netsim/runclock code/build/clock_fast.risc
```

Et avec la [SFML](https://www.sfml-dev.org/index.php) installée, une version graphique de l'horloge et une démo plus complète :

```
make riscv
netsim/runproc code/build/boot.risc vhdd/drive.vhdd
```

Il y a un version du processeur avec l'extension M (multiplication, division) (plus lente à compiler) :

```
make mul
netsim/runproc code/build/boot.risc vhdd/drive_mul.vhdd
```

Effacer les fichiers générés avec : `make clean`.

## Simulateur de netlists

Le simulateur utilise une version modifiée du langage netlist de MiniJazz. Les groupes de bits peuvent contenir jusqu'à 64 bits maximum, mais il est possible d'effectuer des opérations binaires (`AND`, `OR`, ...) sur deux groupes d'un coup (au lieu d'utiliser 2n `SELECT`, n opérations et 2n-2 `CONCAT`). De plus, `CONCAT` peut être utilisé avec un nombre quelconque d'entrées.

Le simulateur de cette version est spécifique aux processeurs. Tout d'abord, la netlist située en `netsim/__build__/proc.net` est compilée en code `C++`. Puis le « runner » qui est choisi (voir runclock.cpp et runproc.cpp) donne les entrées / sorties au processeur.

## Le processeur (RISC-V)

Pour construire le processeur j'ai utilisé une sorte de langage HDL, ou plutôt une librairie que j'ai écrite pour décrire des circuits en Python et générer les netlists correspondantes. Le code de la librairie est dans le dossier `hdl`, et le code Python utilisant la librairie se situe dans le dossier `proc`.

### Design du processeur

Le processeur suit l'architecture RISC-V à quelques différences près. Il reste cependant fonctionnellement strictement équivalent.
-   `JAL` est encodé avec U au lieu de J
-   `branch` est encodé avec S au lieu de B
-   Les différents arguments sont chacun encodés de gauche à droite, cela me semblait naturel de procéder ainsi.

### Clock :stopwatch:

Pour compiler :

```bash
make clock
```

Il y a deux programmes pour la clock. Ils reçoivent sur l'entrée un tick chaque seconde et, au début uniquement, l'heure sous forme de secondes (nombre de secondes depuis minuit). Le premier affiche une nouvelle heure à chaque tick, tandis que le second ignore totalement les ticks et avance le plus rapidement possible, en ré-affichant bien l'entrée à chaque fois que la date stockée change.

```bash
# Version normale
netsim/runclock code/build/clock.risc
# Version rapide ignorant les ticks
netsim/runclock code/build/clock_fast.risc
````


### Processeur avec l'extension M

Pour build :
```bash
make mul
```

Cette version implémente l'extension `M` pour la multiplication, le modulo et la division d'entiers (signés, non-signés). Un programme est fournis en démonstration, compilé sans optimisations pour que les opérations soient effectuées par le processeur directement. C'est le même processeur en dehors de l'extension. Cependant, sa taille énorme devant le reste de l'architecture est la raison pour laquelle pour d'autres usages le processeur est compilé sans l'extension, car cela ralentit beaucoup la simulation. 

```bash
netsim/runproc code/build/boot.risc vhdd/drive_mul.vhdd
```

### Démos d'autres usages :mantelpiece_clock:

Pour build :
```bash
make riscv
```

C'est la version "complète" du processeur et du simulateur. C'est le même processeur que pour la clock, mais le simulateur donne en entrée des périphériques supplémentaires : écran, disque, clavier. La compiler nécessite d'avoir la [librairie SFML](https://www.sfml-dev.org/index.php) installée, pour gérer l'écran.

:warning: Il est normal que la démo prenne du temps à s'afficher, car elle charge un certain nombre de sprites depuis de VHDD vers le contrôleur graphique (tout l'alphabet). Pendant ce temps sera affiché `Loading sprites...` dans la console, et le chargement est fini lorsque le programme affiche `Sprites loaded`.

#### Périphériques

Cette version utilise plusieurs « périphériques virtuels » :
- La sortie texte, utilisée par la clock simple. Cette sortie est controlée en envoyant des caractères sur une sortie du processeur
- Le « disque dur » virtuel : les fichiers utilisés par le programme, y compris le programme lui-même, sont assemblés sur un fichier qui donne une description simple d'un disque avec deux secteurs. Sur le premier se trouve le programme qui va être chargé par `code/build/boot.risc` dans la RAM en position 0 et lancé (call 0). Sur le second se trouve une arborescence de fichiers et de dossiers, comme décrit dans `vhdd/`. Pour stocker des images, j'utilise un format bitmap simple (`.sbi`), stockant 32 bits pour chaque pixel (3 couleurs + alpha).
- L'écran, avec un contrôleur graphique simple. Étant donné qu'afficher des images directement avec le processeur est quelque chose que même nos ordinateurs bien plus puissants ne font pas, j'ai créé un contrôleur assez simple. Il dispose de primitives peu nombreuses permettant de :
  - Dessiner un pixel
  - Dessiner un rectangle
  - Charger une texture dans la mémoire graphique (le simulateur utilise la SFML pour la charger dans la mémoire la texture envoyée par le processeur simulé)
  - Dessiner une texture
  - Actualiser l'écran : cela simule la synchronisation, en utilisant un buffer.
  - Dessiner un triangle (unicolore)
- Le clavier : lorsque des touches sont activées dans la fenêtre, elles sont envoyées au processeur simulé comme une entrée de clavier, sous la forme d'un entier. C'est ce dernier qui devra les interpréter.

L'horloge visuelle peut être lancée avec :
```
netsim/runproc code/build/boot.risc vhdd/drive_clock.vhdd
```

#### Lancer une démo

Comme pour les autres démos, il faut donner au simulateur (`netsim/runproc`) son entrée. Ici, il faut le programme chargé dans la ROM (`code/build/boot.risc`), puis un fichier de "disque" qui va contenir la description du VHDD, entre autres le programme chargé dans la RAM. Par exemple :

```bash
# Mini-clock
netsim/runproc code/build/boot.risc vhdd/drive_clock.vhdd
# Programme de démo
/build_mul.sh && netsim/runproc code/build/boot.risc vhdd/drive.vhdd 
```

La dernière commande lance un programme lance une démo d'un programme qui tourne sur le processeur, dans la RAM, navigable au clavier (touche de direction, touche `ECHAP` pour quitter). Le menu permet de choisir entre les deux versions graphiques de l'hologe, qui répondent aux spécifications du projet : un mini éditeur, ou une mini visualisation 3D d'un cube et d'un autre solide (un peu lente, les calculs étant faits par un processeur simulé... Et quelques glitchs graphiques possibles). Dans la simulation 3D, il est possible d'utiliser les flèches du clavier et les touches `I` (inverser la rotation), `ESPACE` (pause/resume), `ESCAPE` (continuer/fermer).

## Assembler et exécuter un programme quelconque

Un programme C/C++ peut être écrit pour ce processeur. Il peut inclure la mini-librairie que j'ai écrite dans `code/slib`, contenant entre autres une implémentation de fonctions telles que `__mulsi3`, `__udivsi3`, ... utilisées par le compilateur pour remplacer les produits ou divisions, l'allocation de mémoire, et un certain nombre de fonctions et structures. Il peut être ensuite compilé vers de l'assembleur, par exemple pour un fichier `code/prog.cpp` :

```bash
clang --target=riscv32 -std=c++17 -fno-exceptions -march=rv32i -O2 -S code/prog.cpp -o code/build/prog.s
```

Pour transformer l'assembleur en un fichier binaire, il faut utiliser l'assembleur `asmv` :

```bash
python3 asmv -b code/build/prog.s -o code/build/prog.risc
```

Ensuite, il faut construire un disque virtuel avec le programme, et les fichiers dont il aura besoin (s'il n'en a besoin d'aucun, donner un répertoire vide à la commande).

```bash
python3 vhdd/vhdd.py new vhdd/disque_du_prog.vhdd code/build/prog.risc fichiers/a/inclure
```

La version choisie du processeur peut être compilée de son côté :
```bash
# Générer la netlist de riscv.py (par exemple)
cd proc && python3 riscv.py ; cd ..
cp proc/__build__/riscv.net netsim/__build__/proc.net
# Compiler la netlist et un simulateur
make -C netsim proc
```

Enfin, il suffit de lancer le programme de boot sur ce disque virtual

```bash
netsim/runproc code/build/boot.risc vhdd/disque_du_prog.vhdd
```

Il est à noter qu'il est aussi possible de lancer directement le programme dans la ROM avec `netsim/runproc code/build/disque_du_prog.risc vhdd/disque_vide.vhdd`, mais que cela peut causer des dysfonctionnements du programme s'il n'a pas été concu pour cela (la manière dont `clang` compile des variables globales ne fonctionne pas, par exemple dans la ROM, ainsi que l'allocation de mémoire de `slib`).



## Organisation du projet

Voici une vue générale de l'organisation, avec quelques-uns des fichiers principaux :

- `asmv/` : contient l'assembleur (écrit en Python)

	`asmv/` : code de l'assembleur
	`asmv.md` : description (partielle) de l'assembleur
- `code/` : code C++ des programmes tournant sur le processeur
	- `build/` : dossier de compilation (inclus dans le repo), avec les codes assembleur
	
	- `slib/` : mini-librairie C++ avec quelques structures inspirées de la lib standard (cout, vector, string...), l'implémentation des fonctions bas niveau (exit, memory manager (_Znaj, etc...), __umodsi3, ....), et la manipulation des périphériques.
	- `app/` : app de démo, contient le code de l'horloge graphique, de l'éditeur, du menu et de la visualisation 3D.
	- `boot.cpp` : code du « bootloader » qui charge un programme écrit sur le premier secteur du périphérique *disque dur* dans la RAM et l’exécute.
	- `main.cpp` : code du programme principal que j’ai écrit pour ce projet.
	- `clock.cpp` : code pour la clock (mode normal et rapide).
- `hdl/` : lib Python pour générer des netlists décrivant un circuit
	- `hdl/` : code de la lib
- `netsim/` : simulateur de netlist, écrit en C++
	- `src/` : source C++
		- `computer` : gestion des périphériques simulés
		- `netsim` : code pour la simulation de netlists
		- `run.cpp` : code d'un simulateur simple lisant dans un fichier, et simulant une description condensée des netlists
		- `toplevel.cpp` : version interactive de `run.cpp`
		- `compile.cpp` : compile une description de netlist en un programme C++ qui la simule directement. Utilisé pour les deux programmes suivants.
		- `runproc.cpp` : fait tourner le processeur RISC-V compilé à l'aide de `compile.cpp`, gère les entrées-sorties
		- `runclock.cpp` : version un peu épurée de `runproc.cpp`, uniquement pour faire tourner la clock, avec un périphérique de plus donnant une fois l'heure au début
	
	- `run`, `toplevel`, `runproc`, `runclock`, `compile` : versions compilées des programmes ci-dessus
- `proc/` : code pour générer le processeur RISC-V, qui utilise la lib Python de `hdl/`.
	- `riscv.py` : génère le processeur RISC-V
	
	- `riscv_clock.py` : quelques très légères adaptations pour la clock
- `vhdd/` : créer un fichier de « disque dur virtuel » (VHDD) utilisé ensuite dans le générateur pour simuler une version simplifée d'un disque dur
	- `files/` : fichiers inclus dans le disque virtuel
	- `vhdd.py` : génère le vhdd
	- `vhdd.md` : plus de détails dedans
