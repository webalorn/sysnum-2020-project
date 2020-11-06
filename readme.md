# Projet de sysnum

*Ce projet est disponible sur [github](https://github.com/webalorn/sysnum-2020-project)*

**Note :** *ce projet simule un RISC-V. La plupart des programmes sont donc écris en C++ et compilés vers de l'assembleur par clang, et j'utilise ensuite mon propre programme pour le transformer en code binaire qui sera éxécuté par mon processeur. Il faut cependant diposer d'une installation de `clang` supportant la cible `riscv32` pour générer le code assembleur (ce qui ne semble pas le cas partout, j'ai du utiliser une VM linux pour cela). Ainsi le code assembleur est directement fournis et n'est **pas** généré par les commandes de build. Cependant, il peut très bien être régénéré en utilisant `make -C code`.*

## Simulateur de netlists

Un simulateur simple est fourni avec le projet. Il utilise l'ancienne version du simulateur, c'est à dire qu'il ne compile pas les netlists et se contente de les simuler étape par étape. Il existe également une version intéractive de ce simulateur. Pour les compiler, lancer depuis le dossier principal les commandes suivants :

```bash
# Simulateur intéractif
make -C netsim toplevel
# Simulateur lisant dans un fichier
make -C netsim run
```


### Simulateur intéractif

Le simulateur inéractif (`netsim/toplevel`) attends un unique argument : le chemin vers le fichier netlist. Il suffit à chaque cycle de donner les entrées sous la forme de `0` et de `1`, et la sortie sera affichée.

```bash
netsim/toplevel path/to/netlist.net
# Run examples
netsim/toplevel netsim/examples/clock_div.net
netsim/toplevel netsim/examples/fulladder.net
netsim/toplevel netsim/examples/5adder.net
```

### Simulateur non-intéractif

Le simulateur utilisant un fichier d'entrée (`netsim/run`) attend 2 arguments : le chemin vers le fichier de netlist, et le chemin vers le fichier d'entrée. Le fichier d'entrée doit avoir le format suivant : un unique entier, indiquant le nombre de cycles à executer, suivit, pour chaque cycle, des entréee sous la forme de lignes de `0` ou `1`. Plusieurs exemples sont fournis dans le dossier `netsim/examples`.

```bash
netsim/run path/to/netlist.net path/to/input.in
# Run examples
netsim/run netsim/examples/clock_div.net netsim/examples/clock_div.in
netsim/run netsim/examples/fulladder.net  netsim/examples/fulladder.in
netsim/run netsim/examples/5adder.net netsim/examples/5adder.in
```

## Le processeur (RISC-V)

Pour construire le processeur j'ai utilisé une sorte de langage HDL, ou plutôt une librairie que j'ai écrite pour décrire des circuits en python et générer les netlists correspondantes. Le code de la libraire est dans le dossier `hdl`, et le code python utilisant la libraire se situe dans le dossier `proc`.

### Clock :stopwatch:

Pour compiler :

```bash
./build_clock.sh
```

Il y a deux programmes pour la clock. Ils reçoivent sur l'entrée un tick chaque seconde et, au début uniquement, l'heure sous forme de secondes (nombre de secondes depuis minuit). Le premier affiche une nouvelle heure à chaque tick, tandis que le second ignore totalement l'entrée et avance le plus rapidement possible (en gardant bien un affichage par seconde).

```bash
# Version normale
netsim/runclock code/build/clock.risc
# Version rapide ignorant l'entrée
netsim/runclock code/build/clock_fast.risc
````


### D'autres usages

Pour build :
```bash
./build.sh
```

#### Horloge visuelle :mantelpiece_clock:

Une version graphique de l'horloge utilises quelques fonctionalités plus complexes du simulateur. Elle utilise trois « périphériques virtuels » :
- La sortie texte, utilisée par la clock simple. Cette sortie est controlée en envoyant des caractères sur une sortie du processeur
- Le « disque dur » virtuel : les fichiers utilisés par le programme, y compris le programme lui-même, sont assemblés sur un fichier qui donne une description simple d'un disque avec deux secteurs. Sur le premier se trouve le programme qui va être chargé par `code/build/boot.risc` dans la RAM en position 0 et lancé (call 0). Sur le second se trouve une arborescende de fichiers et de dossiers, comme décris dans `vhdd/`. Pour stocker des images, j'utilise un format bitmap simple (`.sbi`), stockant 32 bits pour chaque pixel (3 couleurs + alpha).
- L'écran, avec un contrôleur graphique simple. Étant donné qu'afficher des images directement avec le processeur est quelque chose que même nos ordinateurs bien plus puissants ne font pas, j'ai créé un contrôleur assez simple. Il dispose de primitives peu nombreuses permettant de
  - Dessiner un pixel
  - Dessiner un rectangle
  - Charger une texture dans la mémoire graphique (le simulateur utilise la SFML pour la charher dans la mémoire)
  - Dessiner une texture
  - Actualiser l'écran : cela simule la synchronisation, en utilisant un buffer.

L'horloge visuelle peut être lancée avec :
```
netsim/runproc code/build/boot.risc vhdd/drive_clock.vhdd
```
:warning: Il est normal que l'horloge prenne du temps à s'afficher, car elle load un certain nombre de sprites depuis de VHDD vers le contrôleur graphique (tout l'alphabet, en fait, elle utilise une routine d'une autre partie du projet). Pendant ce temps sera affiché `Loading sprites...` dans la console, et le chargement est fini lorsque le programme affiche `Done`.

#### WIP

(WIP)

## Organisation du projet

Voici une vue générale de l'organisation, avec quelques une des fichiers principaux

- `asmv/` : contient l'assembleur (écrit en python)
	`asmv/` : code de l'assembleur
	`asmv.md` : description (partielle) de l'assembleur
- `code/` : code C++ des programmes tournant sur le processeur
	- `build/` : dossier de compilation (inclu dans le repo), avec les codes assembleur
	- `slib/` : mini-librairie C++ avec quelques structures inspirées de la lib standard (cout, vector, string...), l'implémentation des fonctions bas-niveau (exit, memory manager (_Znaj, etc...), __umodsi3, ....), et la manipulation des périphériques.
	- `boot.cpp` : Code du « bootloader » qui charge un programme écrit sur le premier secteur du périphérique *disque dur* dans la RAM et l'éxécute
	- `main.cpp` : Code du programme principal que j'écris pour ce projet
	- `clock.cpp` : Code pour la clock (mode normal et rapide)
- `hdl/` : lib python pour générer des netlists décrivant un circuit
	- `hdl/` : code de la lib
- `netsim/` : Simulateur de netlist, écrit en C++
	- `src/` : source C++
		- `computer` : gestion des périphériques simulés
		- `netsim` : code pour la simulation de netlists
		- `run.cpp` : code d'un simuleur simple lisant dans un fichier, et simulant une description condensées des netlists
		- `toplevel.cpp` : version intéractive de `run.cpp`
		- `compile.cpp` : compile une description de netlist en un programme C++ qui la simule directement. Utilisé pour les deux programmes suivants.
		- `runproc.cpp` : fait tourner le processeur RISC-V compilé à l'aide de `compile.cpp`, gère les entrées-sorties
		- `runclock.cpp` : version un peu épurée de `runproc.cpp`, uniquement pour faire tourner la clock, avec un périphérique en plus donnant une fois l'heure au début
	- `run`, `toplevel`, `runproc`, `runclock`, `compile` : versions compilées des programmes ci-dessus
- `proc/` : code pour générer le processeur RISC-V, qui utilise la lib python de `hdl/`.
	- `riscv.py` : génère le processeur RISC-V
	- `riscv_clock.py` : quelques très légères adaptations pour la clock
- `vhdd/` : créer un fichier de « disque dur virtuel » (VHDD) utilisé ensuite dans le générateur pour simuler une version simplifée d'un disque dur
	- `files/` : fichiers inclus dans le disque virtuel
	- `vhdd.py` : génère le vhdd
	- `vhdd.md` : plus de détails dedans
