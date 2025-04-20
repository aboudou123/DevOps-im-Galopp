
# Lösung - Tag 4 -Aufgaben

Aufgabe 1: Anzeigen des Inhalts einer Datei und Angabe der Zeilennummern.

<img width="654" alt="Aufabe1" src="https://github.com/user-attachments/assets/4dcc308a-1c3c-4acd-9092-f867acdf01d3" />


Aufgabe 2: Ändern Sie die Zugriffsrechte von Dateien, so dass sie nur vom Eigentümer gelesen, geschrieben und ausgeführt werden können.

<img width="695" alt="Zugriffsrechte" src="https://github.com/user-attachments/assets/e660a411-9383-4621-942c-62ca96c787c2" />



Aufgabe 3: Prüfen Sie die zuletzt von Ihnen ausgeführten 10 Befehle.

<img width="559" alt="History" src="https://github.com/user-attachments/assets/b0d9f5c7-a9a1-49d8-9b5f-8bc7994fa0ae" />
<img width="551" alt="history_tail_10" src="https://github.com/user-attachments/assets/e3933bcf-7ab9-4a5b-a0b0-69861af692f5" />


Augabe 4: Entfernen eines Verzeichnisses und seines gesamten Inhalts.
<img width="620" alt="löchung" src="https://github.com/user-attachments/assets/90e14a72-102f-4731-81b4-3b45ce181eea" />
<img width="771" alt="löschung 2" src="https://github.com/user-attachments/assets/f97bea19-84ff-4f06-be3f-18325cf52712" />



Augabe 5: Erstellen Sie eine Datei `koffit.txt`, fügen Sie den Inhalt hinzu (eine Frucht pro Zeile), und zeigen Sie den Inhalt an.
Fügen Sie den Inhalt der Datei `Galopp.txt` hinzu (eine in jeder Zeile) - Orange, ademe, kafe, cacao, mangue, Orange, ademe,kafe, cacao, mangue, canes

<img width="402" alt="Vim" src="https://github.com/user-attachments/assets/c2efdb5b-927e-4625-a105-a5fba3471765" />


Augabe 6: Fügen Sie den Inhalt der Datei `fruit.txt` hinzu (eine in jeder Zeile) - Apfel, Mango, Banane, Kirsche, Kiwi, Orange, Guave. Fügen Sie dann „Mango“ und   „Guave“   an das Ende der Datei an..
<img width="575" alt="7" src="https://github.com/user-attachments/assets/1d66413f-64ea-4519-8dd8-628401e6795f" />



Augabe 7: Zeigen Sie die ersten Vier Früchte aus der Datei in umgekehrter Reihenfolge.

<img width="617" alt="4fruit renverse" src="https://github.com/user-attachments/assets/57a8fae6-95e8-4272-8ae1-e552a41baa3d" />

Hier hat die Zeile mit 1 begonnen. In 1 gibt es keine Früchte. Die 4. Frucht ist daher Orange. Wenn wir die Liste rückwärts laufen lassen, wäre „Orange“ die erste Frucht und 0 wäre die vierte Frucht.

<img width="490" alt="4 fruits" src="https://github.com/user-attachments/assets/3eb34568-7f99-42a5-a3a2-f6ebdb4e8750" />


<img width="559" alt="Modifikation" src="https://github.com/user-attachments/assets/742cce8d-2dd0-408f-85d5-9f663eb4e39d" />

Augabe 8: Zeigen Sie die untersten Vier Früchte aus der Datei und sortieren Sie sie dann alphabetisch.
<img width="501" alt="unteren" src="https://github.com/user-attachments/assets/855988b8-5fdf-4b66-be13-795fdbbc0a08" />

<img width="617" alt="4fruit renverse" src="https://github.com/user-attachments/assets/0a16872b-5480-4f67-ae7c-101074900b41" />



Augabe 9: Erstellen Sie eine weitere Datei `flagge.txt`, fügen Sie den Inhalt hinzu (eine Farbe pro Zeile), und zeigen Sie den Inhalt an..

echo -e "Rot\nGelb\nGrün" > flagge.txt
🔹 -e erlaubt das Verwenden von \n für Zeilenumbrüche.
🔹 Dadurch hast du eine Farbe pro Zeile in der Datei.
<img width="588" alt="Datei_Flagge" src="https://github.com/user-attachments/assets/59ecf4ee-8344-477f-a50b-3f709c97c32b" />


Augabe 10: Fügen Sie den Inhalt der Datei `flagge.txt` hinzu (eine in jeder Zeile) - Rot, Rosa, Weiß, Schwarz, Blau, Orange, Lila, Grau. Dann fügen Sie „Gelb“ am Anfang der Datei ein..

<img width="606" alt="9_10" src="https://github.com/user-attachments/assets/443b3161-cfc5-4bf9-b176-ed2339835671" />

Inhalt in `flagge.txt` einfügen – **jede Farbe in einer Zeile** – und dann **„Gelb“ an den Anfang** setzen:

### ✅ **1. Datei mit Farben erstellen**
```bash
echo -e "Rot\nRosa\nWeiß\nSchwarz\nBlau\nOrange\nLila\nGrau" > flagge.txt
```

###  **2. „Gelb“ an den Anfang der Datei einfügen**

```bash
sed -i '1i Gelb' flagge.txt
```

🔹 `sed -i` = Datei direkt bearbeiten  
🔹 `'1i Gelb'` = in Zeile 1 „Gelb“ einfügen


<img width="576" alt="Datei_Farben" src="https://github.com/user-attachments/assets/eaada526-6e73-4e55-ab3b-4d9b3a9cb322" />



Augabe 11: Finde die Zeilen, die `fruits.txt` und `Colors.txt` gemeinsam haben, und zeige sie an.




Augabe 12: Zählen Sie die Anzahl der Zeilen, Wörter und Zeichen in `fruits.txt` und `flagge.txt`..




