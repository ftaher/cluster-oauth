function (
	bindDN="openshift",
	url="ldap://example.com:389/DC=example,DC=com"
)

[{
    "apiVersion": "config.openshift.io/v1",
    "kind": "OAuth",
    "metadata": {
        "name": "cluster"
    },
    "spec": {
        "identityProviders": [
            {
                "htpasswd": {
                    "fileData": {
                        "name": "htpass-secret"
                    }
                },
                "mappingMethod": "claim",
                "name": "developer",
                "type": "HTPasswd"
            },
            {
                "ldap": {
                    "attributes": {
                        "email": [
                            "mail"
                        ],
                        "id": [
                            "dn"
                        ],
                        "name": [
                            "cn"
                        ],
                        "preferredUsername": [
                            "sAMAccountName"
                        ]
                    },
                    "bindDN": bindDN,
                    "bindPassword": {
                        "name": "ldap-secret"
                    },
                    "insecure": true,
                    "url": url 
                },
                "mappingMethod": "claim",
                "name": "ldap",
                "type": "LDAP"
            }
        ]
    }
}]
