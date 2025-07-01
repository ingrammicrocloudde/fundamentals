# fundamentals

Dieses Repository stellt Tipps und Templates bereit, um einfache Bicep Deployments durchzuführen.

Um die Bicep Templates bereitzustellen, kann die Bash oder die Azure CLI benutzt werden.

Zuerst ein Terminal in VS Code öffnen und bei Azure einloggen:

```sh
az login
```

Ab hier können die Schritte auch im Azure Portal in der Azure CLI durchgeführt werden.

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
