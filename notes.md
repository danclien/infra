

## Google Cloud


### Billing

#### Set up a billing account
Must be done through the [web UI](https://console.cloud.google.com/billing).


#### List billing accounts
```
gcloud alpha billing accounts list
```

### Projects

#### Listing Projects
```
gcloud projects list
```

#### Creating Projects

```
gcloud alpha projects create <project-id> --name="<project-name>"
```

#### Changing Projects

```
gcloud config set project <project-id>
```



Setting up a project's billing requires the web UI

```
gcloud alpha billing accounts projects link <project-id> --account-id=<account-id>
```
