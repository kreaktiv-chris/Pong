# Pong – Lernprojekt

In diesem Projekt entwickelst du Schritt für Schritt dein eigenes Pong-Spiel.

Ein Teil des technischen Grundgerüsts ist bereits vorbereitet. Du musst dich zunächst nicht darum kümmern, wie Flutter das Fenster zeichnet oder wie die Spielschleife funktioniert.

Die wichtigste Funktion für dich ist:

```dart
void nextTick() {
  ballX = ballX + 1;
}
```

Diese Funktion wird regelmäßig aufgerufen und bildet damit die Spielschleife. Alles, was sich im Spiel bewegen oder regelmäßig geprüft werden soll, kann hier verarbeitet werden.

Bereits vorhandene wichtige Variablen sind unter anderem:

```dart
double ballX;
double ballY;
double ballDurchmesser;

double spielfeldBreite;
double spielfeldHoehe;

bool pfeilHoch;
bool pfeilRunter;
```

Versuche die Aufgaben möglichst selbst zu lösen. Wenn etwas nicht funktioniert, nutze den Debugger, `print()`, die Dokumentation oder suche nach einer Lösung.

---

# Teil 1 – Bewegung des Balls

## Aufgabe 1 – Geschwindigkeit verändern

Der Ball bewegt sich bereits automatisch nach rechts:

```dart
ballX = ballX + 1;
```

Verändere die Geschwindigkeit des Balls.

Probiere aus, was passiert, wenn du statt `1` beispielsweise `2`, `5`, `10` oder `0.5` verwendest.

### Hinweise

`ballX` enthält die aktuelle horizontale Position des Balls.

Wenn du einen größeren Wert addierst, legt der Ball bei jedem Aufruf von `nextTick()` eine größere Strecke zurück.

Versuche auch herauszufinden, was passiert, wenn du eine negative Zahl verwendest.

---

## Aufgabe 2 – Geschwindigkeit in einer Variable speichern

Momentan steht die Geschwindigkeit direkt im Programmcode.

Erstelle eine eigene Variable für die horizontale Geschwindigkeit des Balls.

Ein sinnvoller Name wäre beispielsweise:

```dart
double ballGeschwindigkeitX;
```

Verwende diese Variable anschließend in `nextTick()`.

### Ziel

Am Ende solltest du die Geschwindigkeit nur noch an **einer einzigen Stelle** verändern müssen.

### Hinweise

Anstatt eine feste Zahl zu addieren, kannst du den Inhalt einer Variable addieren.

Eine negative Geschwindigkeit bedeutet Bewegung nach links, eine positive Geschwindigkeit Bewegung nach rechts.

---

## Aufgabe 3 – Ball an der rechten Wand abprallen lassen

Momentan fliegt der Ball irgendwann rechts aus dem Spielfeld.

Sorge dafür, dass er beim Erreichen einer bestimmten X-Position seine Bewegungsrichtung ändert.

### Hinweise

Die aktuelle Position findest du in:

```dart
ballX
```

Mit einer `if`-Abfrage kannst du prüfen, ob der Ball eine bestimmte Position erreicht hat.

Beispiel für den Aufbau einer Bedingung:

```dart
if (bedingung) {
  // etwas machen
}
```

Überlege, wie du die X-Position verändern musst, damit sich der Ball anschließend wieder nach links bewegt.

---

## Aufgabe 4 – Auch an der linken Wand abprallen

Der Ball kann jetzt rechts abprallen, fliegt danach aber links aus dem Spielfeld.

Erweitere deine Lösung so, dass er auch an der linken Wand wieder seine Richtung ändert.

Am Ende soll der Ball dauerhaft zwischen beiden Seiten hin- und herfliegen.

### Hinweise

Du benötigst jetzt zwei Situationen:

* Ball erreicht die rechte Seite
* Ball erreicht die linke Seite

Du kannst mehrere `if`-Abfragen verwenden.

---

## Aufgabe 5 – Spielfeldbreite verwenden

Bisher hast du möglicherweise eine feste Zahl verwendet, um festzustellen, wann der Ball die rechte Wand erreicht.

Das funktioniert jedoch nicht mehr, wenn das Fenster größer oder kleiner wird.

Nutze deshalb die bereits vorhandene Variable:

```dart
spielfeldBreite
```

### Ziel

Der Ball soll unabhängig von der Fenstergröße korrekt an der rechten Wand abprallen.

---

## Aufgabe 6 – Ballgröße berücksichtigen

`ballX` beschreibt den **Mittelpunkt** des Balls.

Wenn du nur prüfst:

```dart
ballX >= spielfeldBreite
```

ist bereits die Hälfte des Balls außerhalb des Spielfeldes.

Sorge dafür, dass der Ball genau dann abprallt, wenn sein äußerer Rand die Wand erreicht.

### Hinweise

Die Größe des Balls steht in:

```dart
ballDurchmesser
```

Überlege, welchen Abstand der Mittelpunkt des Balls von seinem äußeren Rand hat.

---

# Teil 2 – Bewegung in zwei Dimensionen

## Aufgabe 7 – Ball auch nach oben oder unten bewegen

Bisher verändert sich nur:

```dart
ballX
```

Füge jetzt eine Bewegung auf der Y-Achse hinzu.

Dafür steht bereits:

```dart
ballY
```

zur Verfügung.

### Hinweise

Erstelle zusätzlich eine Variable für die Y-Geschwindigkeit.

Zum Beispiel:

```dart
double ballGeschwindigkeitY;
```

Verändere anschließend bei jedem `nextTick()` sowohl `ballX` als auch `ballY`.

---

## Aufgabe 8 – Oben und unten abprallen

Der Ball bewegt sich jetzt diagonal, kann aber oben oder unten aus dem Spielfeld verschwinden.

Sorge dafür, dass er auch an der oberen und unteren Wand abprallt.

### Hinweise

Die Höhe des Spielfeldes steht in:

```dart
spielfeldHoehe
```

Für die vertikale Bewegung ist die Y-Geschwindigkeit zuständig.

Auch hier musst du den Radius des Balls berücksichtigen.

---

## Aufgabe 9 – Unterschiedliche Flugrichtungen testen

Verändere die Werte von:

```dart
ballGeschwindigkeitX
ballGeschwindigkeitY
```

und beobachte die Flugbahn.

Teste beispielsweise Werte, bei denen:

* X und Y gleich groß sind
* X größer als Y ist
* Y größer als X ist
* Y negativ ist

### Ziel

Verstehe, wie sich die beiden Geschwindigkeiten gemeinsam auf die Flugrichtung auswirken.

---

## Aufgabe 10 – Zufällige Startbewegung

Der Ball soll beim Start nicht immer exakt gleich fliegen.

Verwende Zufallszahlen, um unterschiedliche Startgeschwindigkeiten zu erzeugen.

### Hinweise

Dart besitzt dafür die Klasse:

```dart
Random
```

Dafür benötigst du:

```dart
import 'dart:math';
```

Informiere dich darüber, wie `Random` verwendet wird.

Achte darauf, dass der Ball nicht mit Geschwindigkeit `0` startet.

---

# Teil 3 – Der erste Schläger

## Aufgabe 11 – Schläger hinzufügen

Auf der rechten Seite des Spielfeldes soll ein rechteckiger Schläger erscheinen.

Schau dir an, wie der Ball im vorhandenen `Stack` dargestellt wird.

Der Ball verwendet unter anderem:

```dart
Positioned
Container
```

Nutze dasselbe Prinzip für deinen Schläger.

### Ziel

Auf der rechten Seite soll ein einfaches Rechteck erscheinen.

Noch muss es sich nicht bewegen.

---

## Aufgabe 12 – Schlägerposition als Variable speichern

Momentan hast du die Position vermutlich direkt im `Positioned` eingetragen.

Erstelle eine Variable für die vertikale Position des Schlägers.

Zum Beispiel:

```dart
double schlaegerY;
```

Verwende diese Variable anschließend bei der Darstellung.

### Ziel

Die Position des Schlägers soll durch das Verändern einer Variable geändert werden können.

---

## Aufgabe 13 – Größe des Schlägers als Variablen speichern

Lege für Höhe und Breite des Schlägers eigene Variablen an.

Zum Beispiel:

```dart
double schlaegerHoehe;
double schlaegerBreite;
```

Verwende sie anschließend sowohl beim Zeichnen als auch später bei der Kollisionsprüfung.

---

# Teil 4 – Steuerung

## Aufgabe 14 – Schläger nach oben bewegen

Die Tastaturerkennung ist bereits vorbereitet.

Wenn die Pfeiltaste nach oben gedrückt gehalten wird, ist:

```dart
pfeilHoch
```

`true`.

Nutze diesen Wert in `nextTick()`, um den Schläger nach oben zu bewegen.

### Hinweise

Auf dem Bildschirm werden kleinere Y-Werte weiter oben dargestellt.

---

## Aufgabe 15 – Schläger nach unten bewegen

Wenn die Pfeiltaste nach unten gedrückt wird, ist:

```dart
pfeilRunter
```

`true`.

Nutze diese Variable, damit sich der Schläger nach unten bewegt.

---

## Aufgabe 16 – Bewegungsgeschwindigkeit des Schlägers

Erstelle eine eigene Variable für die Geschwindigkeit des Schlägers.

Dadurch soll später an einer einzigen Stelle festgelegt werden können, wie schnell sich der Spieler bewegen kann.

---

## Aufgabe 17 – Schläger im Spielfeld halten

Momentan kann der Spieler seinen Schläger oben oder unten aus dem Spielfeld herausbewegen.

Verhindere das.

### Hinweise

Du kennst:

```dart
spielfeldHoehe
schlaegerY
schlaegerHoehe
```

Überlege auch hier, ob `schlaegerY` die obere Position oder den Mittelpunkt des Schlägers beschreibt.

Lege dich bewusst auf eine Variante fest und verwende sie überall einheitlich.

---

# Teil 5 – Kollision mit dem Schläger

## Aufgabe 18 – Prüfen, ob der Ball den Schläger erreicht

Prüfe zunächst nur die horizontale Position.

Stelle fest, wann der Ball die X-Position des Schlägers erreicht.

### Hinweise

Dafür benötigst du unter anderem:

```dart
ballX
ballDurchmesser
schlaegerBreite
```

und die X-Position deines Schlägers.

---

## Aufgabe 19 – Höhe des Schlägers berücksichtigen

Nur weil der Ball die X-Position des Schlägers erreicht, bedeutet das noch nicht, dass er den Schläger tatsächlich trifft.

Prüfe zusätzlich, ob sich der Ball auf der richtigen Höhe befindet.

### Hinweise

Vergleiche die Y-Position des Balls mit:

```dart
schlaegerY
schlaegerHoehe
```

Der Ball besitzt selbst ebenfalls eine Größe.

---

## Aufgabe 20 – Ball am Schläger abprallen lassen

Wenn eine Kollision erkannt wurde, soll der Ball wieder nach links fliegen.

Verändere dazu die horizontale Geschwindigkeit des Balls.

### Ziel

Der Ball soll jetzt sowohl an den Wänden als auch am Schläger abprallen.

---

# Teil 6 – Punkte

## Aufgabe 21 – Erkennen, wenn der Ball den Schläger verpasst

Wenn der Ball rechts aus dem Spielfeld fliegt, ohne den Schläger zu treffen, wurde ein Punkt erzielt.

Erkenne diesen Zustand.

### Hinweise

Nutze:

```dart
ballX
spielfeldBreite
```

---

## Aufgabe 22 – Punktestand speichern

Erstelle eine Variable für den Punktestand.

Für Punkte eignet sich ein ganzzahliger Datentyp.

Erhöhe die Punktzahl jedes Mal, wenn der Ball den rechten Spielfeldrand erreicht.

---

## Aufgabe 23 – Punktestand anzeigen

Zeige den aktuellen Punktestand auf dem Bildschirm an.

Dafür kannst du beispielsweise ein:

```dart
Text(...)
```

Widget verwenden.

Da sich dein Spielfeld bereits in einem `Stack` befindet, kannst du den Punktestand ebenfalls darin positionieren.

---

## Aufgabe 24 – Ball nach einem Punkt zurücksetzen

Nach einem Punkt soll der Ball wieder in der Mitte des Spielfeldes erscheinen.

Es gibt bereits die Funktion:

```dart
reset()
```

Schau dir an, was diese Funktion macht.

Nutze sie an einer geeigneten Stelle.

---

## Aufgabe 25 – Reset vervollständigen

Der Reset-Button setzt momentan nur bestimmte Werte zurück.

Erweitere `reset()`, sodass auch:

* Geschwindigkeiten
* Punkte
* Schlägerpositionen

sinnvoll zurückgesetzt werden.

Überlege dabei, welche Werte bei einem kompletten Neustart wirklich zurückgesetzt werden sollen.

---

# Teil 7 – Zweiter Spieler

## Aufgabe 26 – Zweiten Schläger hinzufügen

Füge auf der linken Seite einen zweiten Schläger hinzu.

Versuche möglichst wenig Code einfach zu kopieren.

Überlege zunächst, welche zusätzlichen Variablen du benötigst.

---

## Aufgabe 27 – Tastatursteuerung für Spieler 2

Spieler 2 soll mit:

```text
W
S
```

gesteuert werden.

Die vorhandene Tastaturabfrage verarbeitet bisher die Pfeiltasten.

Erweitere sie um zwei weitere Tasten.

Dafür kannst du dir ansehen, wie diese Werte geprüft werden:

```dart
LogicalKeyboardKey.arrowUp
LogicalKeyboardKey.arrowDown
```

Suche nach den entsprechenden Tastencodes für `W` und `S`.

---

## Aufgabe 28 – Kollisionsprüfung für Spieler 2

Der Ball soll auch am linken Schläger abprallen.

Übertrage deine bereits vorhandene Kollisionslogik auf Spieler 2.

### Ziel

Jetzt kann der Ball zwischen beiden Spielern hin- und hergespielt werden.

---

## Aufgabe 29 – Punkte für beide Spieler

Erstelle einen eigenen Punktestand für beide Spieler.

Verpasst der rechte Spieler den Ball, erhält Spieler 1 einen Punkt.

Verpasst der linke Spieler den Ball, erhält Spieler 2 einen Punkt.

Zeige beide Punktestände an.

---

# Teil 8 – Ein vollständiges Spiel

## Aufgabe 30 – Gewinner bestimmen

Das Spiel soll nicht unbegrenzt laufen.

Lege beispielsweise fest:

```text
Wer zuerst 10 Punkte erreicht, gewinnt.
```

Prüfe nach jedem Punkt, ob einer der Spieler die notwendige Punktzahl erreicht hat.

---

## Aufgabe 31 – Spiel beenden

Wenn ein Spieler gewonnen hat, darf sich der Ball nicht weiterbewegen.

Erstelle dafür eine Variable, die speichert, ob das Spiel aktuell läuft.

Beispielsweise könnte dafür ein `bool` verwendet werden.

---

## Aufgabe 32 – Gewinner anzeigen

Wenn das Spiel beendet wurde, soll auf dem Bildschirm angezeigt werden, welcher Spieler gewonnen hat.

Du kannst dafür wieder ein `Text`-Widget verwenden.

---

## Aufgabe 33 – Neues Spiel starten

Der vorhandene Reset-Button soll nach dem Spielende ein komplett neues Spiel starten können.

Dabei müssen alle wichtigen Werte wieder ihren Ausgangszustand erhalten.

---

# Teil 9 – Das Spiel interessanter machen

## Aufgabe 34 – Ball bei jedem Treffer schneller machen

Nach jedem erfolgreichen Treffer auf einem Schläger soll der Ball etwas schneller werden.

### Hinweise

Du besitzt bereits Geschwindigkeitsvariablen für X und Y.

Achte darauf, dass das Vorzeichen erhalten bleibt.

Ein nach links fliegender Ball sollte nach einer Geschwindigkeitserhöhung weiterhin nach links fliegen.

---

## Aufgabe 35 – Maximale Geschwindigkeit

Wenn der Ball nach jedem Treffer schneller wird, wird er irgendwann unspielbar.

Lege deshalb eine maximale Geschwindigkeit fest.

Prüfe vor einer weiteren Erhöhung, ob diese Grenze bereits erreicht wurde.

---

## Aufgabe 36 – Abprallwinkel verändern

Momentan ändert sich beim Treffen des Schlägers vermutlich nur die X-Richtung.

Verbessere das Verhalten.

Trifft der Ball:

* oben auf den Schläger → soll er stärker nach oben fliegen
* mittig → eher gerade
* unten → stärker nach unten

### Hinweise

Vergleiche:

```dart
ballY
```

mit der Position und Höhe des Schlägers.

Berechne, wie weit der Treffer von der Mitte des Schlägers entfernt war.

---

## Aufgabe 37 – Zufällige Startrichtung

Nach einem Punkt soll der Ball nicht immer zum selben Spieler starten.

Wähle zufällig, ob er zunächst nach links oder rechts fliegt.

---

## Aufgabe 38 – Pause nach einem Punkt

Nach einem erzielten Punkt soll der Ball kurz in der Mitte stehen bleiben, bevor die nächste Runde beginnt.

Überlege, wie du speichern kannst, ob eine Runde momentan läuft.

---

## Aufgabe 39 – Countdown

Baue vor dem Start einer Runde einen Countdown ein:

```text
3
2
1
GO!
```

Der Ball darf sich erst nach dem Countdown bewegen.

---

# Teil 10 – Computergegner

## Aufgabe 40 – Computer übernimmt einen Schläger

Baue einen Spielmodus ein, bei dem einer der beiden Schläger automatisch gesteuert wird.

Der Computer kennt:

```dart
ballY
```

und die Position seines eigenen Schlägers.

Bewege den Schläger in Richtung des Balls.

---

## Aufgabe 41 – Computer nicht perfekt spielen lassen

Wenn der Computer immer exakt der Position des Balls folgt, ist er fast unschlagbar.

Begrenze deshalb seine Bewegungsgeschwindigkeit.

Der Computer darf sich pro Tick nur um eine bestimmte Strecke bewegen.

---

## Aufgabe 42 – Schwierigkeitsgrade

Füge unterschiedliche Schwierigkeitsgrade hinzu.

Zum Beispiel:

### Einfach

Langsamer Computergegner.

### Mittel

Schnellerer Computergegner.

### Schwer

Sehr schneller Computergegner.

Überlege, welche Variable du verändern kannst, ohne die gesamte Spiellogik umzuschreiben.

---

# Teil 11 – Menü und Spielzustände

## Aufgabe 43 – Startmenü

Erstelle ein einfaches Menü, bevor das Spiel beginnt.

Der Spieler soll auswählen können:

```text
1 Spieler
2 Spieler
```

Optional kannst du anschließend auch den Schwierigkeitsgrad auswählen lassen.

---

## Aufgabe 44 – Pause

Ermögliche es, das laufende Spiel zu pausieren.

Während einer Pause dürfen sich:

* Ball
* Spieler
* Computergegner

nicht bewegen.

---

## Aufgabe 45 – Spielzustand speichern

Bisher verwendest du möglicherweise mehrere `bool`-Variablen wie:

```dart
spielLaeuft
spielPausiert
spielBeendet
```

Überlege, ob du den Zustand des Spiels übersichtlicher speichern kannst.

Informiere dich dazu über:

```dart
enum
```

Mögliche Zustände könnten beispielsweise sein:

```text
menue
countdown
spielen
pause
beendet
```

---

# Teil 12 – Code verbessern

## Aufgabe 46 – `nextTick()` aufräumen

Mit der Zeit wird `nextTick()` wahrscheinlich sehr groß.

Teile den Code in mehrere Funktionen auf.

Beispielsweise könntest du Funktionen für folgende Aufgaben erstellen:

```text
Ball bewegen
Spieler bewegen
Kollisionen prüfen
Punkte prüfen
```

Die Namen und genaue Aufteilung bestimmst du selbst.

### Ziel

`nextTick()` soll am Ende einfach erkennen lassen, **was** pro Spielschritt passiert.

---

## Aufgabe 47 – Doppelte Logik finden

Suche im Programm nach Code, der für Spieler 1 und Spieler 2 fast identisch ist.

Überlege, wie du diesen Code zusammenfassen kannst.

### Ziel

Änderungen sollen möglichst nicht an mehreren Stellen gleichzeitig notwendig sein.

---

## Aufgabe 48 – Eigene Klasse für einen Schläger

Momentan besitzt du wahrscheinlich viele einzelne Variablen:

```text
Position Spieler 1
Position Spieler 2
Breite Spieler 1
Breite Spieler 2
Höhe Spieler 1
Höhe Spieler 2
Geschwindigkeit Spieler 1
Geschwindigkeit Spieler 2
```

Das wird schnell unübersichtlich.

Erstelle deshalb eine eigene Klasse für einen Schläger.

### Informiere dich über

```dart
class
```

Eine Klasse kann Daten und Funktionen zusammenfassen, die logisch zusammengehören.

---

## Aufgabe 49 – Eigene Klasse für den Ball

Lagere anschließend auch den Ball in eine eigene Klasse aus.

Überlege, welche Informationen zu einem Ball gehören.

Zum Beispiel:

```text
X-Position
Y-Position
X-Geschwindigkeit
Y-Geschwindigkeit
Durchmesser
```

Überlege auch, welche Funktionen sinnvoll zum Ball gehören könnten.

---

# Teil 13 – Dein eigenes Pong

## Aufgabe 50 – Verbessere das Spiel selbstständig

Das Grundspiel ist jetzt fertig.

Ab hier entscheidest du selbst, was du verbessern möchtest.

Mögliche Ideen:

* Sounds
* Animationen
* unterschiedliche Ballfarben
* unterschiedliche Spielfeldgrößen
* verschiedene Schläger
* Power-Ups
* Mehrball-Modus
* Highscore
* Statistiken
* Einstellungen
* verschiedene Spielmodi
* bessere Menüs
* Touch-Steuerung für Smartphones

Ab jetzt gibt es keine genaue Anleitung mehr.

Überlege dir eine eigene Funktion, plane wie du sie umsetzen möchtest und programmiere sie selbst.

---

# Wichtig

Bei diesem Projekt geht es nicht darum, jede Aufgabe sofort perfekt zu lösen.

Wenn dein Programm funktioniert, ist das zunächst ein Erfolg.

Später wirst du lernen, denselben Code übersichtlicher, kürzer und besser strukturiert zu schreiben.

Ein funktionierender erster Versuch ist besser als eine perfekte Lösung, die nie fertig wird.