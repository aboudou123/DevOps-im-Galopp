 **Linux Dateiberechtigungen und Zugriffskontrolllisten (ACLs)**

1-Add User

![image](https://github.com/user-attachments/assets/aba019ac-404e-4381-89c8-a6365b373a8e)



2 Delect User

![image](https://github.com/user-attachments/assets/1f55360e-e176-47b6-8ba1-c9448f8517b9)





## 1. **Grundlagen: Dateiberechtigungen in Linux**

![image](https://github.com/user-attachments/assets/70223a1b-b524-46a9-940f-0ee3f74ca0ae)






**Berechtigungsanzeige** (z.B. mit `ls -l`):
```
-rwxr-xr--
| | | | |
| | | | +-- Others: read + no write + no execute
| | | +---- Group: read + no write + execute
| | +------ Owner: read + write + execute
| +-------- Dateityp: - (Datei) oder d (Verzeichnis)
```

![image](https://github.com/user-attachments/assets/7b5207c9-e1dc-4ff1-ab39-e0e7ba098aa0)



![image](https://github.com/user-attachments/assets/1ed5d8e9-7f35-4df8-8cf1-ca5f83319c42)


Creer un groupe

![image](https://github.com/user-attachments/assets/7c19af71-cc02-4a9d-9245-6ba1f16ea3a7)


Verrifier si le nom du groupe est present

![image](https://github.com/user-attachments/assets/e856ad57-456f-410e-893a-c4274e555f43)

Ajoutons un autre utilisteur dans le groupe

![image](https://github.com/user-attachments/assets/179f05cc-18e6-477e-97c5-fe7dadace7e4)

![image](https://github.com/user-attachments/assets/60f806b0-60fc-45df-8818-780460259651)


Commande top

![image](https://github.com/user-attachments/assets/e7d9a618-5093-4e6b-b00b-9bbb3b8eed43)



Verrifier l'espace de votre disque

![image](https://github.com/user-attachments/assets/f2b2979f-e748-4f0f-aad8-f8c39d2bd607)


Creer un Utilisateur

![image](https://github.com/user-attachments/assets/595968f1-3ab5-42c6-ab1d-ca4156e0049d)

===============================================================================
**Änderung von Rechten**:
- `chmod` (change mode): Rechte ändern
- `chown` (change owner): Eigentümer ändern
- `chgrp` (change group): Gruppe ändern

Beispiel:
```bash
chmod 755 datei.txt
# Owner: lesen, schreiben, ausführen
# Group: lesen, ausführen
# Others: lesen, ausführen
```

---

## 2. **Erweiterung: Zugriffskontrolllisten (ACLs)**
Die normalen Dateiberechtigungen reichen oft nicht, wenn man komplexere Zugriffsregeln braucht. **ACLs** (Access Control Lists) erlauben es, **feiner** zu steuern, wer was darf.

### Vorteile von ACLs:
- Zugriff für **mehrere Benutzer oder Gruppen** individuell definieren.
- **Flexiblere Kontrolle** als mit klassischen Berechtigungen.

### Wichtige Befehle:

| Befehl | Beschreibung |
|:------|:-------------|
| `getfacl datei.txt` | Zeigt die ACL einer Datei an |
| `setfacl` | Setzt oder ändert ACLs |

### Beispiel: ACL setzen
```bash
setfacl -m u:alice:rwx datei.txt
```
➡️ Benutzer **alice** erhält **lesen, schreiben, ausführen** Rechte auf `datei.txt`, unabhängig von normalen Rechten.

Weitere Beispiele:
- Zugriff für eine Gruppe erlauben:
  ```bash
  setfacl -m g:entwickler:r-- datei.txt
  ```
- Standard-ACLs für ein Verzeichnis setzen (vererben an neue Dateien):
  ```bash
  setfacl -d -m u:bob:rw- /verzeichnis
  ```

---

## 3. **Zusammenspiel: Standardrechte und ACLs**
- Wenn eine Datei ACLs hat, wird bei `ls -l` ein `+` angezeigt:
  ```bash
  -rw-r--r--+ 1 user group 0 Apr 26 09:00 datei.txt
  ```
- Ohne explizite ACLs gelten nur die klassischen Owner-Group-Others Regeln.

---



[Tag 3](https://github.com/aboudou123/DevOps-im-Galopp/tree/main/Tag%203)
