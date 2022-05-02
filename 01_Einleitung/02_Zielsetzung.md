---
lang: de
---

# Zielsetzung

## Titel:
Erstellung eines Maschinenmodells zur Validierung der Auslegung und Regelung elektrischer Maschinen - Objektorientierte Modellierung eines rotierenden Frequenzumformers

## Aufgabe:
Die Regelung elektrischer Maschinen geschieht auch heute noch häufig mit dem Einsatz von PI- bzw. PID-Reglerstrukturen. Das Einstellen der Reglerparameter wird dabei, sofern kein selbsteinstellender Regler (Autotuning) verwendet  wird, manuell und mit Hilfe von Erfahrungswerten oder Einstellregeln durchgeführt. Dazu muss jedoch zuerst die zu regelnde Maschine existieren; die Anpassung des Reglers kann also erst nach Entwicklung der Anlage, mit der Produktion eines ersten Prototypen erfolgen. Um diesen Entwicklungszyklus zu verkürzen, soll im Rahmen dieser Arbeit am Beispiel eines rotierenden Frequenzumformers ein Modell der elektrischen Maschine aufgestellt werden, an dem der Regler eingestellt und erprobt werden kann.

In dieser Arbeit soll zunächst das Gesamtsystem "rotierender Frequenzumformer" hinsichtlich Informations- und Energiefluss zu dokumentiert werden, um einen Überblick über das System zu geben. Im Anschluss soll ein Modell des Systems aufgestellt, simuliert und zur Charakterisierung des Systems eingesetzt werden. Dazu ist es notwendig, geeignete Anforderungen an das Modell (Gütekriterien, Einschränkungen, Anwendungsbereiche) zu stellen. Weiterhin muss das aufgestellte Modell mit Parametern aus der Auslegung der Maschine versehen und mittels Messungen an einer realen Maschine validiert werden. Der Aufbau des Modells soll dabei akausal (d.h. ohne a priori Vorgabe der Energieflussrichtung) und objektorientiert (d.h. unterteilt in physikalisch abgegrenzte Baugruppen) erfolgen, um eine möglichst große Wiederverwendbarkeit der Modelle zu ermöglichen.

Die zentralen Fragen, die in dieser Arbeit beantwortet werden sollen, sind daher:

- 	Wie muss ein Modell aufgebaut werden, um hinreichend genau die reale Maschine abzubilden? 
- Wenn es unterschiedliche Modellvarianten gibt, wie unterscheiden Sie sich und welche Vor- und Nachteile haben sie?
- Welche Randbedingungen sind zwingend einzuhalten und welche Randbedingungen sind optional?
- Welchen Einfluss haben die Maschinenparameter und die Regelparameter auf das dynamische Verhalten der Maschine?
- Optional: Welchen Einfluss hat eine Variation der Eingangsgrößen (Maschinen- und Regelparameter) sowie die Maschinengröße auf das dynamische Verhalten der Maschine?  

## Zeitlicher Ablauf:
- [x] Entwurf eines Modells in der Simulationsumgebung OpenModelica auf Basis der ModelicaStandardLibrary v3.2.3
- [x] Aufnahme von Messwerten an einem realen Frequenzumformer
- [x] Auswerten der Messergebnisse (bis Ende Februar)
- [x] Validieren & Überarbeiten des Simulationsmodells (bis Ende Februar)
- [x] Dynamisches Verhalten der Maschine (Zeitkonstanten, Einschwingverhalten bei Laständerungen) (bis Anfang März)
- [x] Optional: Parametervariation, Charakterisierung  (bis Mitte März)
- [ ] Dokumentation, Bachelorarbeit schreiben (Wunschabgabetermin bis 06.05.2022)

## Literatur:
[1]A. Binder, Elektrische Maschinen und Antriebe: Grundlagen, Betriebsverhalten. Berlin, Heidelberg: Springer Berlin Heidelberg, 2012. doi: 10.1007/978-3-540-71850-5.

[2]C. Bohn und H. Unbehauen, Identifikation dynamischer Systeme: Methoden zur experimentellen Modellbildung aus Messdaten. Wiesbaden: Springer Vieweg, 2016. doi: 10.1007/978-3-8348-2197-3.

[3]C. Bohn, „Regelungstechnik I“, TU Clausthal, 2019.

[4]J. Esch, „Ein Verfahren zur güteoptimalen Parametrierung von PID-Reglern“, Universität Duisburg-Essen, Duisburg, 2016.

[5]P. Fritzson und A. Pop, „Introduction to Object-Oriented Modeling and Simulation with Modelica and OpenModelica“, S. 217.

[6]J. F.-H. Gesenhues, „Objektorientiert-modellbasierte Charakterisierung, Überwachung und Regelung des technisch unterstützen Herz-Kreislauf-Systems“, Rheinisch-Westfälische Technische Hochschule Aachen, 2019.

[7]H. Hanse, „Einfluss der Nutgeometrie auf das dynamische Betriebsverhalten fremderregter Synchronmaschinen“, Bachelorarbeit, TU Clausthal, Clausthal Zellerfeld, 2020.

[8]K. Janschek, Systementwurf mechatronischer Systeme. Berlin, Heidelberg: Springer Berlin Heidelberg, 2010. doi: 10.1007/978-3-540-78877-5.

[9]C. Kral, Modelica: objektorientierte Modellbildung von Drehfeldmaschinen. München: Fachbuchverlag Leipzig im Carl Hanser Verlag, 2019.

[10]R. Kutzner u. a., „Modellierung und Simulation von Kraftwerksblöcken“, auto, Bd. 58, Nr. 9, S. 533–540, Sep. 2010, doi: 10.1524/auto.2010.0869.

[11]P. F. Orlowski, „Reglereinstellung und Regleroptimierung“, in Simulation und Optimierung von Regelkreisen mit dem IBM AT und Kompatiblen, Wiesbaden: Vieweg+Teubner Verlag, 1988, S. 11–13. doi: 10.1007/978-3-322-88843-3_3.

[12]T. L. Schmitt und M. Andres, Methoden zur Modellbildung und Simulation mechatronischer Systeme: Bondgraphen, objektorientierte Modellierungstechniken und numerische Integrationsverfahren. Wiesbaden [Heidelberg]: Springer Vieweg, 2019.

[13]H. Unbehauen, Regelungstechnik. 1: Klassische Verfahren zur Analyse und Synthese linearer kontinuierlicher Regelsysteme, Fuzzy-Regelsysteme: ... 25 Tabellen, 15., Überarb. und erw. Aufl. Wiesbaden: Vieweg+Teubner, 2008.

