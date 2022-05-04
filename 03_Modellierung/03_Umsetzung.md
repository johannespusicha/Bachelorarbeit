> [!TODO]+ ToDo:
> - [ ] Maschinen beschreiben
> - [ ] Parametrierung der Maschinen herleiten
> - [ ] Parameter für Spannungsregler
> - [ ] Überlegen, in welchem Kapitel Modellvergleiche gemacht werden sollen. Oder will ich das Modellweise behandeln?
> - [x] Die vollständige Liste der Parameter gehört wahrscheinlich besser in den Anhang

> [!TIP]+ Modelica
> Bei Modelica geht weder um das Aufstellen der systembeschreibenden Differentialgleichungen noch um das sich drücken davor. Es geht um die Verknüpfung der in den Basiselementen niedergelegten Differentialgleichungen, aus denen das System aufgebaut ist

## Umsetzung
Die im Folgenden beschriebene Modellierung des Frequenzumformers erfolgt auf Basis der `Modelica Standard Library v3.2.3` (MSL, siehe [@modelicaassociationModelicaStandardLibrary2020]). So weit nicht weiter angegeben sind alle im Folgenden angegebenen Bibliotheken und Klassen abgeleitete Klassen der MSL. Für das entwickelte Modell und benötigte Hilfsklassen wird eine eigenständige Bibliothek `Frequenzumformer` angelegt. Alle Klassen, die dieser Bibliothek angehören werden mit `Frequenzumformer.Klasse` bezeichnet.
Die vollständige Bezeichnung der abgeleiteten Klassen zeigt die objektorientierte Hierarchie. Beginnend bei der Basisklasse wird jede übergeordnete Klasse mit einem Punkt vor den Klassennamen abgetrennt angefügt, z.B. `Modelica.Bibliothek.Abgeleitete_Klasse`. 

Für den Asynchronmotor und den Synchrongenerator werden die Modelle `AIM_SquirelCage` und `SM_ElectricalExcited` aus der Bibliothek `Magnetic.FundamentalWave` der MSL verwendet. Die Herleitung dieser Modelle ist umfangreich in \cite[]{kralModelicaObjektorientierteModellbildung2019} beschrieben und soll hier nur kurz zusammengefasst werden. Verwendet werden die jeweiligen transienten elektrischen Komponenten und Maschinen, da nur mit diesen Einschwingvorgänge beobachtet werden können. Die quasistationären Modelle (Klassen in den Paketen `Electrical.QuasiStationary` und `Magnetic.QuasiStatic`) verwenden zur Berechnung der elektrischen und magnetischen Größen komplexe Zeiger, die nicht geeignet sind zur Untersuchung von Einschwingvorgängen[^1]. 

Nach \cite[S. 149]{kralModelicaObjektorientierteModellbildung2019} werden für die betrachteten Maschinen in der MSL folgende Voraussetzungen und Vereinfachungen getroffen:
- Die Wicklungen sind vollständig symmetrisch ausgeführt.
- Oberwellen der magnetischen im Luftspalt werden vernachlässigt.
- Sättigungseffekte werden vernachlässigt.

> [!NOTE]+ Was will ich schreiben?
> - Wie steht das Modell in Verbindung mit dem Wortgraphen?
> - --> Ich will zeigen, dass ich verstanden habe, was in dem Modell vor sich geht und ich nicht bloß blind einige Icons zusammengeklickt habe.
> - Welche Parameter müssen in das Modell eingegeben werden?
> - Woher bekomme ich die Parameter? Wie rechne ich die Parameter um?
> - --> Ich will dokumentieren, wie das Gesamtmodell aussieht, welche Details es umfasst und welche Details es nicht umfasst
> - --> Wie erreiche ich es, dass das Modell meine Anforderungen erfüllt -/- Welche Anforderungen/Einschränkungen muss ich treffen, damit das Modell valide ist?
> - Welche Modellteile habe ich aus der Modelicabibliothek verwendet und welche Modellteile habe ich selbst entwickelt?
> - Warum habe ich für mein Modell Modelica verwendet und nicht Simulink/Simplorer/... oder ein rein mathematisches Modell?

### Asynchronmotor mit Kurzschlussläufer
Das vollständige Modell der Asynchronmaschine mit Kurzschlussläufer, wie es in der MSL verwendet wird, zeigt <mark>XXX</mark>. Da die Drehfeldmaschinen in vielen Bereichen gleich oder zumindest ähnlich aufgebaut sind, legt \cite{ @kralModelicaObjektorientierteModellbildung2019 } den Asynchron- und Synchronmaschinen der MSL ein *partielles Modelica-Modell*[^2] für Drehfeldmaschinen zugrunde (`FundamentalWave.Interfaces.PartialBasicInductionMachine`). Das unterstützt den objektorientierten Modellierungsansatz, sodass diese Grundstruktur nicht für jede elektrische Maschine neu aufgestellt werden muss.

#### Partielles Modell der Drehfeldmaschine
Das partielle Modell der Drehfeldmaschine (siehe <mark>XXX</mark>) modelliert die Energieübertragung vom elektrischen Netzanschluss des Stators über den Luftspalt auf den Rotor, wie sie schon in <mark>XXX</mark> betrachtet wurde. Die Ausgestaltung des Rotormodells und der mögliche Anschluss elektrischer Klemmen an den Rotor (z.B. über Schleifringe) ist dann Teil der Spezialisierung des Modells für die einzelnen elektrischen Maschinen. Neben der Stator-Rotor-Kopplung bietet das partielle Modell auch einen Sammelpunkt für Wärmeenergie aller Teilkomponenten, eine mechanische Trägheitskomponente für die Trägheit des Rotors der Maschine verbunden mit einem Lagerreibungsmodell und einem optionalen mechanischen Anschluss zur Abstützung des Stators.

![[PartialBasicInductionMachine.svg]]
Partielles Modell der Drehfeldmaschine `FundamentalWave.Interfaces.PartialBasicInductionMachine` der MSL v3.2.3

Die Energiewandlung im Stator geschieht über das Wicklungsmodell `FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding`, welches neben der elektro-magnetischen Kopplung auch ohmsche Verluste sowie Streu- und Wirbelstromverluste des Magnetfelds berücksichtigt[^3] (siehe <mark>XXX</mark>). 

![[SymmetricMultiPhaseWinding.svg]]
Wicklungsmodell`FundamentalWave.BasicMachines.Components.SymmetriMultiPhaseWinding`der MSL v3.2.3

Über das Luftspaltmodell (`FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap`) wird der Abfall der magnetischen Spannung über dem magnetischen Widerstand des Luftspalts sowie das auf den Rotor wirkende Drehmoment modelliert. Um die magnetischen Größen des Stators und des Rotors in Beziehung zueinander zu setzen ist eine Koordiantentransformation der Statorgrößen in das körperfeste Bezugssystem des Rotors implementiert (*d,q-System*).

#### Modell
<mark>XXX</mark> zeigt das vollständige Modell der Asynchronmaschine mit Kurzschlussläufer (`FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage`). Es ergibt sich aus dem partiellen Modell durch Hinzufügen des kurzgeschlossenen Käfigmodells (`FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding`), welches <mark>XXX</mark> zeigt.

Da die Anzahl $N_R$ der Rotorstäbe eines Käfigs häufig viel größer ist als die Anzahl $m$ der Phasen des Systems, ist es numerisch einfacher für den Käfig eine $m$-phasige kurzgeschlossene Windung als Ersatzmodell zu verwenden, welche die gleiche effektive Windungszahl wie die Statorwicklung aufweist. (\cite[S. 194]{kralModelicaObjektorientierteModellbildung2019})


![[AIM_SquirrelCage.svg]]
Vollständiges Modell der Asynchronmaschine mit Kurzschlussläufer (`FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage`)
![[SymmetricMultiPhaseCageWinding.svg]]
M-phasiges Käfig-Ersatzmodell (`FundamentalWave.Components.SymmetricMultiPhaseCageWinding`)

#### Parametrierung
Zur Parametrierung der Maschine müssen drei Arten von Größen angegeben werden: elektrische, mechanische und thermische Größen. Da bei Adaptieren des Frequenzumformer-Modells auf andere Maschinengrößen vorrangig die elektrischen und mechanischen Größen  angepasst werden müssen, werden diese Werte in einem eigenen Recod-Modell (`Frequenzumformer.Maschinenparameter.AIM_SquirrelCageData`) zusammengefasst. Das ermöglicht auch die Umrechnung der im Datenblatt der Maschine angegebenen Reaktanzen in die für die Simulation benötigten Induktivitäten. 

Die thermischen Größen (Betriebspunkts- und Referenztemperaturen von Stator und Rotor, Temperaturabhängigkeit der Widerstände) werden auf $\unit[20]{°C}$ Umgebungstemperatur eingestellt, wobei die Temperaturabhängigkeit der Widerstände vernachlässigt werden soll. 

Wie schon oben erwähnt, verwendet das Modell der Asynchronmaschine nach außen hin zur Parametrierung der Wicklungen Stator- und Rotorinduktivitäten, sowie die effektive Statorwindungszahl. Die Induktivitäten sind die auch im T-Ersatzschaltbild der Maschine (vgl. <mark>XXX</mark>) angegeben Größen: Hauptfeldinduktivität ($L_m$), Stator-Streuinduktivität ($L_{s\sigma}$) und Rotor-Streuinduktivität ($L_{r\sigma}$). Im Datenblatt der Maschine sind die Reaktanzen $X_0, X_1, X_2$ angegeben. Die zugehörigen Induktivitäten ergeben sich mit der Netzfrequenz $f_{Netz}=\unit[50]{\mathrm{Hz}}$ nach
$$
\begin{align}
L_m &= \frac{X_0}{2\pi f_{Netz}} \\
L_{s,\sigma} &= \frac{X_1}{2\pi f_{Netz}} \\
L_{r,\sigma} &= \frac{X_2}{2\pi f_{Netz}}.
\end{align}
$$
Für die effektive Windungszahl (`effectiveStatorTurns`) gibt \cite[S. 217]{kralModelicaObjektorientierteModellbildung2019} 
$$
N_{\mathrm{eff. s}} = \hat{N}\cdot\xi_{\mathrm{c}}\cdot\xi_{\mathrm{z}},
$$
an, mit der *Statorwindungszahl* $\hat{N}$, dem *Sehnungsfaktor* $\xi _{\mathrm{c}}$ und dem *Zonenfaktor* $\xi _{\mathrm{z}}$. Ebenda angegeben sind die Ausdrücke <mark>XXX</mark> für die beiden Faktoren $\xi _{\mathrm{c}}$ und $\xi_{\mathrm{z}}$ (\cite[S. 165, S. 217]{kralModelicaObjektorientierteModellbildung2019}).
$$
\begin{align}
\xi _{\mathrm{c}} &= \sin(\frac{\Delta\gamma _{\mathrm{c}}}{2}) \\
\xi _{\mathrm{z}} &= \frac{\sin(\frac{\pi}{6})}{q\sin(\frac{\pi}{6q})}
\end{align}
$$
Die *Spulenweite* $\Delta\gamma _{\mathrm{c}}$ ist gemäß $$
\Delta\gamma _{\mathrm{c}} = 2\pi\cdot\frac{y _{\mathrm{Q}}}{S'}
$$das Verhältnis des *Nutschritts* ($y_Q$) zur Anzahl der *Nuten je Polpaar* ($S'=\sfrac{Q}{2p}$) multipliziert mit $2\pi$ (\cite[S. 168, S. 161]{kralModelicaObjektorientierteModellbildung2019}), vgl. \cite[S. 76, S. 119]{binderElektrischeMaschinenUnd2012}). Ebenso ist die *Lochzahl* ($q$) zur Berechnung des Zonenfaktors das Verhältnis der Anzahl der Nuten zur Anzahl der Stränge und Pole (vgl. \cite[S. 151]{kralModelicaObjektorientierteModellbildung2019})$$
q = \frac{Q}{2pm}.
$$
Damit ist die Statorwindung der Asynchronmaschine vollständig parametriert. Die Wicklungsdaten und die daraus nach <mark>XXX</mark> berechneten Werte listet <mark>XXX</mark> auf. Alle weiteren Größen zur Beschreibung der Asynchromaschine können direkt aus dem Datenblatt entnommen und sind ebenfalls in <mark>XXX</mark> angegeben. 

Dabei ist für das Trägheitsmoment $J_{\mathrm{r}}=0$ eingetragen, da aus der Auslegung des Frequenzumformer nur ein kombiniertes Trägheitsmoment der Welle mit den Rotoren aller drei Maschinen und dem Lüfter bekannt ist. Da die die Modellierung der Welle starr (d.h. ohne Berücksichtigung der Elastizität oder der inneren Dämpfung der Welle) geschieht, kann dieses kombinierte Trägheitsmoment im Trägheitsmoment des Lüftermodells zusammengefasst werden. 

### Synchrongenerator mit Dämpferkäfig
Das Modell des Synchrongenerators basiert wie auch das der Asynchronmaschine auf dem oben schon dargestellten partiellen Drehfeldmaschinenmodell. Es fügt dem partiellen Modell ein einphasiges elektro-magnetisches Kopplungsmodell und ein Bürstenmodell für die elektrische Erregung hinzu und bietet einen optionalen Dämpferkäfig, ähnlich zu dem Kurzschlussläufer der Asynchronmaschine.

#### Modell

#### Parametrierung

### Erregermaschine

#### Modell

#### Parametrierung

### Spannungsregler

#### Modell

#### Parametrierung

### Gesamtmodell

#### Parametrierung


## Mögliche Quellen:
[@modelicaassociationModelicaStandardLibrary2020]
[@kralModelicaObjektorientierteModellbildung2019]
[@hanseEinflussNutgeometrieAuf2020]
[@binderVorlesungElektrischeMaschinen2019]
[@bonfertBetriebsverhaltenSynchronmaschine1962]
[@IEEEGuideSynchronous]


[^1]: Die Zeiger der komplexen Wechselstromrechnung ergeben sich aus der Fouriertransformation periodischer eingeschwungener Größen.  
[^2]: Modell, das mit dem Modifizierer `partial` versehen ist. Das Modell muss nicht die gleiche Anzahl von Gleichungen und Unbekannten haben. Es bietet die Möglichkeit Strukturen des Modells bei der Vererbung zu verändern (`replace`). Ein solches Modell kann nicht allein simuliert werden.
[^3]: Das Modell berücksichtigt bei ungeradzahligen mehrphasigen Systemen außerdem noch die Nullinduktivität. Das wird jedoch nur benötigt, wenn die Wicklung unsymmetrisch belastet wird (\cite[S. 193]{kralModelicaObjektorientierteModellbildung2019}), was in der hier betrachteten Anwendung nicht auftritt. 