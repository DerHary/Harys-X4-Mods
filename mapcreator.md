# X4 Sector Creator 1.4.4 - Arbeitsnotizen

Stand: 2026-07-05

## Quellen

- GitHub Repo: https://github.com/Ven0maus/X4SectorCreator
- Releases: https://github.com/Ven0maus/X4SectorCreator/releases
- Nexus Mod Seite: https://www.nexusmods.com/x4foundations/mods/1641
- Reddit Post vom Autor: https://www.reddit.com/r/X4Foundations/comments/1j2z469/x4_sector_creator_by_venomaus/

## Kurzfazit

Das Tool ist ein WinForms-Generator fuer X4-Mapmods.
Es kann:

- Cluster anlegen
- Sektoren anlegen
- Gates verbinden
- Resource Areas setzen
- Regionen/Region Definitions pflegen
- Stationen, Jobs, Fabriken, Custom Factions erzeugen
- komplette Custom Galaxy bauen

Wichtig:

- Pro Cluster maximal 4 Sektoren
- 1.4.4 ist fuer X4 V9 gedacht
- In 1.4.4 wurden `Resource Areas` auf das Sektor-Fenster verschoben
- alte Save-/Config-Dateien konvertieren Region-Ressourcen nicht automatisch zu Resource Areas

## Bedienlogik

- Vieles wird per Doppelklick bearbeitet: Cluster, Sektoren, Gates, Regionen, Stationen
- Gates kann man per Rechtsklick rotieren
- Regionen kann man mit gehaltenem Rechtsklick in der Groesse ziehen
- Cluster kann man in der Map-Ansicht per Rechtsklick schnell umpositionieren
- `Export/Import Config` ist Pflicht, wenn man spaeter weiterbauen will

## Minimaler Workflow fuer 1 neuen Sektor

1. Tool starten
2. Cluster anlegen oder existierenden Cluster waehlen
3. Sektor anlegen
4. Sektorradius, Sunlight, Economy, Security setzen
5. Gates zu bestehendem oder neuem Sektor bauen
6. Wenn noetig `Resource Areas` direkt im Sektor pflegen
7. Optional: Regionen, Stationen, Jobs, Faction-Logik
8. `Generate MOD`
9. Mod-Ordnername + eindeutigen Prefix angeben
10. `Open XML Folder`
11. Ergebnis nach `X4 Foundations/extensions/<dein_modname>` kopieren
12. Mod ingame aktivieren

## Wichtige technische Details

### Sektoren

- Neue Sektoren bekommen automatisch Zonen.
- Die Zonenzahl skaliert mit dem Sektorradius.
- Im Code liegen die Grenzen bei grob 5 bis 10 generierten Zonen.
- Gueltiger Radius im UI: 1 bis 999.
- Default ist 250 km Radius.

### Cluster

- Maximal 4 Sektoren pro Cluster.
- README sagt 4 pro Cluster, der Code erzwingt das auch.
- Cluster koennen eigenen Soundtrack bekommen.

### Resource Areas

Seit 1.4.4 werden Ressourcen nicht mehr ueber das Region-Definition-Fenster gepflegt, sondern als `Resource Areas` direkt am Sektor.

Eine Resource Area hat:

- `Ware`
- `Yield`
- `Size`
- `Speed`
- `Amount`

Der Generator schreibt das als `resourcearea ref="sphere_<size>_<ware>_<yield>_<speed>" amount="<n>"`.

Wichtig:

- Ein hoher Yield bedeutet laut Community nicht automatisch, dass die Sonde riesige Sterne zeigt.
- `Amount` ist also relevant, nicht nur `Yield`.

### Faction Logic

- Sektorweise deaktivierbar
- Wenn in einem Cluster alle Sektoren gleich gesetzt sind, schreibt das Tool die Einstellung auf Cluster-Ebene

### Random Anomalies

- Pro Sektor per Checkbox
- Das Tool setzt dafuer das Tag `allowrandomanomaly`

## Custom Galaxy: Vorsicht

Hier ist eine echte Stolperfalle.

Code-Beobachtung:

- Die generierte Custom-Gamestart-Datei setzt in `gamestarts.xml` nur die Galaxy-Macro-Referenz.
- Ein expliziter Startsektor/-cluster wird dort nicht gesetzt.

Praxis-Hinweis aus Nexus-Kommentaren:

- Nutzer meldeten bei Custom Galaxy leere Startsektor-Auswahl und Ruecksprung ins Hauptmenue bei 100% Ladebalken.
- Ein Nutzer schrieb, dass es nach dem Hinzufuegen von Jobs fuer Custom Factions funktionierte.

Arbeitsregel fuer uns:

- Fuer den Anfang lieber **keine komplette Custom Galaxy**, sondern erstmal einen neuen Sektor an das Vanilla-Universum anhaengen.
- Wenn spaeter doch Custom Galaxy: Jobs/Faction-Logik/Gamestart besonders kritisch pruefen.

## Custom Factions: Vorsicht

Bekannte Hinweise:

- `xenon` wurde fuer Custom-Faction-Erstellung entfernt bzw. als nicht funktional markiert
- In 1.4.3 wurde der prozedurale `robot`-Typ entfernt
- Auf Nexus gibt es einen aktuellen Bericht, dass Boron-basierte Custom-Faction-Schiffe/Stationen visuell Probleme haben koennen

Heisst fuer uns:

- Fuer den ersten Sektor besser mit Vanilla-Factions arbeiten
- Custom Faction erst danach

## Empfohlener sicherer Start

Wenn du einfach einen neuen Sektor bauen willst, ohne spaeter Mist rueckbauen zu muessen:

1. Vanilla-Galaxie beibehalten
2. 1 neuen Cluster oder 1 neuen Sektor an existierenden Cluster haengen
3. 1-2 Gate-Verbindungen bauen
4. Eigentuemer erstmal `None` oder Vanilla-Faction
5. 1-3 einfache Resource Areas setzen
6. Keine Custom Faction im ersten Schritt
7. Config exportieren
8. Mod generieren und im Spiel testen

## Nuetzliche Detailnotizen fuer spaeter

- Das Tool hat ein eingebettetes Tutorial-Video: https://www.youtube.com/embed/CywvNiwQGTs
- Release 1.4.4: `Resource Areas` neu im Sector Window, Base-Game-Regionen nicht mehr im JSON-Save exportiert
- Jobs/God/Faction-Logik haben Sonderbehandlung fuer `Custom Galaxy`
- DLC-spezifische Aenderungen werden in eigene XML-Pfade fuer Extensions geschrieben

## Meine Arbeitsregel fuer diesen Chat

Ich leite dich erstmal entlang des sicheren Pfads:

- erst Sektor an Vanilla andocken
- dann Ressourcen
- dann Gates
- dann Test ingame
- erst danach optional Regionen, Stationen, Jobs, Factions
