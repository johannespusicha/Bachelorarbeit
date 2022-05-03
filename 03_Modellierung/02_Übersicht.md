## Übersicht - Energie- und Informationsfluss
> [!TODO]+ ToDo
> - [x] Übersicht geben, wie Maschinenteile zusammenhängen
> - [x] Was wirkt wie? 
> - [x] Was bewirkt eine Änderung dieser Größe bei anderen Größen? 
> - [x] Was hängt wie zusammen?
> - [x] evtl. formalisieren als Wirkungsgraph/Bondgraph etc.
> - [x] Grundlage geben, aus der sich das Modelica Modell sozusagen "von selbst" ergibt --> im Modelica-Modell sollten vor Allem Details und Simulationsspezifische Infos hinzugefügt werden. 
> - [ ] Diskretisierung der Regler --> Blockschaltbilder der zeitdiskreten P, I und D-Regler
> - [x] Abtastung
> - [x] Quantisierung auf 16bit signend Integer
> - [x] Reales D-GLied --> Zeitkonstante für D-Regler

> [!question]- Soll ich die Details zur Abtastrate hier oder in Parametrierung erwähnen?
> Ich denke, das ist besser unter Modellierung aufgehoben. Da kann ich dann Modellierung und Parametrierung zusammen behandeln

Bevor das Simulationsmodell in Modelica implementiert werden soll, ist es hilfreich zunächst einen Überblick über das Gesamtsystem "rotierender Frequenzumformer" zu erlangen und die Wirkungseinflüsse der einzelnen Größen zu studieren.

### Gesamtsystem
Wie schon in der Einführung gezeigt handelt es sich bei der betrachteten Anlage im Wesentlichen um einen Motor-Generator-Verbund aus einem Asynchronmotor und einem mit einer Synchron-Erregermaschine erregten Synchrongenerator. Das System besteht also aus drei mechanisch gekoppelten elektrischen Maschinen. Der Zusammenhang zwischen den elektrischen Größen am Stator und am Rotor der elektrischen Maschinen sowie die Kopplung mit der rotatorischen Bewegung wird über das Induktionsgesetz durch die Spannung und den Fluss des magnetischen Feldes charakterisiert. 

![[Fluss_Umformer.png]]

In Anlehnung an die Bondgraphen-Methode zeigt der "Wort-Bondgraph"[^1] (oder "Wortgraph"[^1]) <mark>XXX</mark> den Energie- und Informationsfluss im Frequenzumformer. 

Die Halbpfeile (<mark>XXX</mark>) repräsentieren den Energiefluss (die übertragene Leistung) der zusammenhängenden *Fluss-* (*Flow*) und *Potential*größen (*Effort*). Nach Konvention werden die Potentialgrößen oberhalb und die Flussgrößen unterhalb der Halbpfeils aufgetragen. <mark>Alternativ kann auch die Flussgröße direkt an einem Knoten notiert werden, wenn die Größe für alle verbundenen Kanten konstant ist.</mark> Im Gegensatz zu den formalen Bondgraphen können die Knoten des Wortgraphen mehrere Größen und Verbindungen, die zum Aufstellen des Zustandsraummodells nötig wären, unter einem  Oberbegriff zusammenfassen und vereinfachen (*Objektorientierung*). Ist eine solche detaillierte Darstellung gesucht, können die einzelnen Oberbegriffe jeweils durch ihre korrespondierenden Bondgraph-Darstellungen ersetzt werden. Bondgraphen für die einzelnen elektrischen Maschinen können beispielsweise [@borutzkyBondGraphModelling2011, p.269ff.] entnommen werden. 

Ursache für den in <mark>XXX</mark> dargestellten Energiefluss ist der Vorgabe der Spannung am Netz-Eingang. Sie bewirkt einen Stromfluss im Stator, der einerseits zur Speicherung (Streuinduktivität) und Abgabe (omsche Verluste) elektrischer Energie in den Statorwindungen führt und andererseits zur Wandlung elektrischer Energie in magnetische führt. Diese Energie wird über den Luftspalt (der wie ein Transformator das Verhältnis der magnetischen Spannung zum Fluss wandelt[^2]) auf den Rotor übertragen. Im Rotor wird eine Spannung induziert, die einen Stromfluss zur Folge hat. Über die Lorentzkraft folgt die Wandlung in kinetische (rotatorische) Energie. 

Während die Winkelgeschwindigkeit der Welle für angrenzenden Baugruppen gleich ist, teilt sich das Motormoment auf. Ein Teil der Energie wird über die Massenträgheit in der Welle gespeichert und ein Teil verlässt das System durch Reibungseffekte (Lagerreibung, Luftwiderstand, ...). Der größte Teil wird jedoch an den Synchro-Generator und die Erregermaschine übertragen. 

Die Hauptaufgabe der Erregermaschine ist es, die Spannung am Ausgang des Reglersystems berührunglos auf den Rotor des Synchrogenerators zu übertragen. Dies geschieht durch Wandlung der elektrischen Energie und Übertragung über den Luftspalt der Maschine. Gekoppelt sind Generator und Erregermaschine über den mitrotierenden Gleichrichter. Der Synchro-Generator wandelt die eingebrachte mechanische Energie und die Erregung über den Luftspalt in elektrische Energie.

Zusätzlich zu dem Energiefluss ist in <mark>XXX</mark> auch der Informationsfluss angedeutet: Am Ausgang des Umformers wird der Spannungsabfall über der Last gemessen und die Differenz zum Sollwert in den Regler zurückgeführt. Der PID-Spannungsregler ist hier zusammengefasst dargestellt. Ein ausführliches Blockschaltbild des Reglers zeigt <mark>XXX</mark>. Aus der vom Regler berechneten Stellgröße wird über Puls-Weiten-Modulation eines Steuertrafos die Statorspannung der Erregermaschine erzeugt.


[^1]: Bezeichnung nach [@roddeckBondgraphenModellbildungUnd2019, p.10].
[^2]: Beachte den Bezug auf Stator- (s) bzw. Rotorseite (s).

### PID-Spannungsregler
Als Spannungsregler wird von <mark>Piller</mark> in dem Frequenzumformer ein PID-Regler (**P**roportional-**I**ntegral-**D**ifferential) mit *variabler Verstärkung* eingesetzt. Die variable Verstärkung dient zum Erreichen eines besseren Einschwingverhaltens bei großen Regelabweichungen (\cite{ @DigitalerSpannungsreglerSoftwaredokumentation }). <mark>XXX</mark> zeigt das Blockschaltbild des Reglers. Der PID-Regler ist in Parallelstruktur ausgeführt; an den Ausgängen der Regelglieder und am Gesamtausgang <mark>werden die Stellgrößen begrenzt.</mark> Die einzelnen Regelglieder werden zusätzlich zu möglichen Zeitkonstanten jeweils mit einem eigenen Verstärkungsfaktor gewichtet.
![[Blockschaltbild_Regler.png]]

Implementiert ist der PID-Regler als digitaler Regler auf einem Mikrocontroller. Dabei sind einige Punkte zu beachten:
- Die ideale Umsetzung eines Differenzierers (D-Glied) ist nicht möglich. Stattdessen wird ein DT_1-Glied verwendet, welches sich aus der Kombination eines D-Glieds mit einem Verzögerungsglied 1.~Ordnung ergibt.
- Die Algorithmen für die Regelglieder arbeiten zeitdiskret. Beschrieben werden diese Glieder mit Übertragungsfunktionen, die aus der $\mathcal{Z}$-Transformation hervorgehen.
- Die Erfassung der Ausgangsspannung erfolgt nur zu bestimmten Zeitpunkten (Abtastung). Nach \cite{ @DigitalerSpannungsreglerSoftwaredokumentation } erfasst der hier betrachtete Spannungsregler 32 Messwerte in 5 Taktzyklen, wobei sich die Taktfrequenz nach der Frequenz der Ausgangsspannung richtet. Die Abtastrate für die Spannungsmessung beträgt also $$
  \begin{align}
  T_{\mathrm{mess}}^*&= \frac{5}{32}\cdot T_{\mathrm{Spannung}} = 0,000390625\,\mathrm s. \\
  \text{mit} \quad
  T_{\mathrm{Spannung}}&= \frac{1}{400\,\mathrm{Hz}}=0,0025\,\mathrm s
  \end{align}
  $$Weiterhin gibt \cite{ @DigitalerSpannungsreglerSoftwaredokumentation } an, dass bei einer Spannungsfrequenz von $f=400\,\mathrm{Hz}$ der Regelalgorithmus nur alle zwei Messzyklen neu berechnet wird. Die Periodendauer des zeitdiskreten Reglers beträgt also$$
  \begin{align}
  T_{mess}&=2\cdot T_{mess}^*= 0,00078125\,\mathrm s.
  \end{align}$$
- Die Digitalisierung der Spannungsmessung bedeutet eine Quantisierung der Werte. Die gemessenen Werte werden Reglerintern auf $2^{16}$ ganzzahlige vorzeichenbehaftete Werte (*"16 bit signend integer"*) abgebildet, also auf das Intervall $[-32768,32767]$. Um den Zusammenhang zwischen der realen Spannung und der internen Darstellung herzustellen, müssen Umrechnungsfaktoren angegeben werden.

