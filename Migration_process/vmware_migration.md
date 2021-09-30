## Azure server migration

#### requriement 
* vm ware 
* EXSI server 

## VMware VMs to Azure

#### First, we need to set up an Azure Migrate project. Once logged into the Azure Portal search for the Azure Migrate service and select Assess and migrate servers:

* Create the Migration Project by filling in the details such as 
    * resource group  
    * subscription. 

* project details such as 
    * project Name :
    * geography : (location or Region)

* Then select Select migration tool tab:
    * Select Azure Migrate: Server Migration  
    * select Review + add tool(s)  
    * click Add Tools:
* Now our Migration Project has been created

## Installing the Azure Migrate OVA

* Now that we have the project created we need to download the Azure Migrate OVA
    * install it on our on-premise VMware environment. 
    * Again, in the Azure portal, 
        * under Azure Migrate: Server Migration select Discover:
        * On the “Are your machines virtualized?” dropdown select Yes, with VMware vSphere Hypervisor and on the “How do you want to replicate?” drop-down select Using agentless replication.
        * Then select Download to download the OVA
    * Once the OVA file has been downloaded log into VCenter and Deploy OVF Template:
    * Select Local File and browse to the OVA download. Run through the OVF Deploy wizard to finish deploying the OVA:Once the OVA template has completed deploying. 
    * Console into the VM, you will be prompted to set the Administrator password. 
    * Once logged in, Internet Explorer will automatically open to the server with port ```44368```. This will be the set up for the Azure Migrate appliance, it’s pretty intuitive but we will go through the major steps. 
    #### The first step, of course, is to accept the license terms:

        * After the validation steps run, we will need to download and extract the VMware vSphere Virtual Disk Development Kit. A link will be provided to the download.
        * NOTE: You must have a VMware account to download the files. Just download the Zip version and extract the files to the specified folder in the step: 
    #### Next, we have to register the new appliance with our Azure Migrate Project. Select the 
        * subscription, 
        * Migrate Project,
        * appliance name:
    #### Lastly, we need to connect the appliance to our vSphere environment. You can create a custom account in vCenter with these specific permissions. For the sake of the demonstration I’m just going to use the administrator@vsphere.local credentials:like 
        * vcenter server name\ip :
        * user Name :
        * password :
    *  now server will start migration
## Run an Azure Migrate Test Migration
* Microsoft recommends running a test migration before migrating any VM over to Azure. 
* The test migration does not affect the on premise VM, It simply deploys a VM in Azure with the replicated data. 
* Typically you would want to deploy the test to a development network etc. To start a test, inside the Azure Migrate Appliance window click on the name of the server

    * Now we have this fancy screen that allows us to perform our Test Migration:
    * We choose the network in Azure to deploy to and select Migrate:
    * We will be able to see all the steps of the test migration
    * Once complete, we can see that our VM is now in Azure with a -test appended to the name. We can run our tests and verify that the applications are working on the server. 
    * I can telnet into my 7 Days to Die server successfully so I know it’s up and working: 
    * After the testing is complete, we can have Azure Migrate clean up our test migration. Navigate your way back to the Azure Migrate Appliance screen and click on the VM name and choose Clean up test migration: 
___finish___

