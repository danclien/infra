# Notes
Temporary notes


## Prerequisites

* Google account
* Sign up for [Google Cloud Platform](https://cloud.google.com)
* [Install Cloud Tools](https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version)
* Run `gcloud init` authenticate `gcloud` to your account
* Set up a billing account
* Create a proejct
* Link the billing account with your project
* Set `gcloud` to the correct project


## SSL certiciates

* Use [Let's Encrypt](https://letsencrypt.org) for SSL certiciates
* Use [`kube-lego`](https://github.com/jetstack/kube-lego) to automatically generate SSL for the Kubernetes cluster?


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


### DNS

#### Enable Cloud DNS for your project

Fill in the `<project-id>` below and enable the API from the GCP GUI:

```
https://console.developers.google.com/apis/api/dns/overview?project=<project-id>
```

#### Create managed zone for a domain
```
gcloud dns managed-zones create danclien-com --dns-name="danclien.com" --description="danclien.com"
gcloud dns managed-zones create dacali-com --dns-name="dacali.com" --description="dacali.com"
gcloud dns managed-zones create dacali-org --dns-name="dacali.org" --description="dacali.org"
gcloud dns managed-zones create lisalandry-org --dns-name="lisalandry.org" --description="lisalandry.org"
gcloud dns managed-zones create firelevel-com --dns-name="firelevel.com" --description="firelevel.com"
```


#### Set up NS records in domain registrar
Get the require nameservers for each domain:
```
gcloud dns managed-zones describe danclien-com | grep googledomains >> dns-ns.txt
gcloud dns managed-zones describe dacali-com | grep googledomains  >> dns-ns.txt
gcloud dns managed-zones describe dacali-org | grep googledomains  >> dns-ns.txt
gcloud dns managed-zones describe lisalandry-org | grep googledomains  >> dns-ns.txt
gcloud dns managed-zones describe firelevel-com | grep googledomains  >> dns-ns.txt

danclien.com
- ns-cloud-b1.googledomains.com.
- ns-cloud-b2.googledomains.com.
- ns-cloud-b3.googledomains.com.
- ns-cloud-b4.googledomains.com.

```


#### Set up MX records


##### Importing MX records
```
gcloud dns record-sets import google-cloud-dns/dacali-com --zone-file-format --zone=dacali-com
```


##### Google Apps

MX records for Google Apps
```
1 ASPMX.L.GOOGLE.COM
5 ALT1.ASPMX.L.GOOGLE.COM
5 ALT2.ASPMX.L.GOOGLE.COM
10 ALT3.ASPMX.L.GOOGLE.COM
10 ALT4.ASPMX.L.GOOGLE.COM
```

```
gcloud dns record-sets export danclien-com --zone-file-format -z danclien-com

```

##### Google Domains Email Forwarding
```
5 gmr-smtp-in.l.google.com
10 alt1.gmr-smtp-in.l.google.com
20 alt2.gmr-smtp-in.l.google.com
30 alt3.gmr-smtp-in.l.google.com
40 alt4.gmr-smtp-in.l.google.com
```



#### Export zone files
