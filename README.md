# fundamentals

Dieses Repository stellt Tipps und Templates bereit, um einfache Bicep Deployments durchzuführen.

Um die Bicep Templates bereitzustellen, kann die Bash oder die Azure CLI benutzt werden.

Zuerst ein Terminal in VS Code öffnen und bei Azure einloggen:

```sh
az login
```

Ab hier können die Schritte auch im Azure Portal in der Azure CLI durchgeführt werden.

TIPP: 

Wenn die Azure CLI benutzt wird, sollten die folgenden Dateien über den Button "Upload Files" hochgeladen werden:

- storage.bicep
- vm.bicep
- vnet.bicep
- main.bicep
um den Hinweis auf unsichere Passwort Parameter auszublenden, kann außerdem die Datei
**bicepconfig.json** hochgeladen werden.

Parameter sind in der Datei **main.bicepparam** änderbar. Nach dem Ändern abspeichern und ebenso über "Upload Files" hochladen.

**Wichtig: Die Warnung** *The configuration value of bicep.use_binary_from_path has been set to 'false'* **kann ignoriert werden**. 

Dann die Subscription festlegen:

```sh
az account set --subscription "Your-Subscription-Name-or-ID"
```

Ressourcengruppe erstellen:

```sh
az group create --name YourResourceGroupName --location eastus
```

Und dann die Datei bereitstellen:

```sh
az deployment group create --resource-group YourResourceGroupName --template-file main.bicep
```
