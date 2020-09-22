<h2>Intro</h2>
<p>Purpose of this repository to implement a simple example pipeline to demonstrate DevSecOps in practice.</p>

<p>Infrasructure made with Terraform and Amazon Web Services. The project will contains the following instances:</p>
<ul>
    <li>Jenkins (with docker engine)</li>
    <li>Sonarqube</li>
    <li>ZAP</li>
    <li>Source Composition Analysis</li>
    <li>A sample application (Tomcat 'hello world' app)</li>
</ul>

<h2>Prerequisites</h2>
<ul>
    <li>Terraform (https://learn.hashicorp.com/tutorials/terraform/install-cli)</li>
    <li>Amazon Web Services account (https://aws.amazon.com/resources/create-account/)</li>
</ul>
<p>You can skip these steps if you have already configured Terraform with your AWS account on your machine.</p>
<ol>
    <li>Setup Terraform on your machine: https://learn.hashicorp.com/tutorials/terraform/install-cli </li>
    <li>Add you AWS account following: https://learn.hashicorp.com/tutorials/terraform/aws-build</li>
    <li>Create AWS ssh key and add its name to the terraform/variables.tf "keyname" variable.
</ol>

<h2>Warning</h2>
<p>Starting infrastructure described in Terraform template will cost $0.05 per hour. SonarQube not able to run on t2.micro free tier eligible instance due to low resources. Every other components of the project is free tier eligible.</p>

<h2>Setup</h2>
<h3>Terraform</h3>
<ol>    
    <li>After Terraform template applied, you can access created instances with the Terraform output information from the CLI:</li>
    <img src="https://github.com/patrik93/devsecops-sample/blob/master/images/terraform-apply-output?raw=true" alt="Terraform output message">
</ol>
<h3>SonarQube</h3>
<ol>    
    <li>You can access SonarQube server with the DNS provided by Terraform output with the addition of port 9000 e.g. http://sonar-dns:9000. The default login and password is admin:admin.</li>
    <li>To generate a token, to go <i>User > My Account > Security</i>. Your existing tokens are listed here, each with a Revoke button.
        
The form at the bottom of the page allows you to generate new tokens. Once you click the Generate button, you will see the token value. Copy it immediately; once you dismiss the notification you will not be able to retrieve it. This token will be used in Jenkins.</li>
</ol>
<h3>Jenkins</h3>
<ol>    
    <li>You can access Jenkins server server with the DNS provided by Terraform output with the addition of port 8080 e.g. http://jenkins-dns:8080</li>
    <li>When you accessed the Web UI, follow the instructions and chose <i>"Install suggested plugins"</i> option.</li>
    <li>At the home page of Jenkins go to <i>"Manage Jenkins"-> "Manage Plugins"</i>. On the Available tab, search for "SSH Agent" and "SonarQube Scanner" plugins and install them without restart.</li>
    <li>In the credential store, add new credentials (<i>"Manage Jenkins" -> "Manage Credentials"</i>). <p><img src="https://github.com/patrik93/devsecops-sample/blob/master/images/add-creds-jenkins.png" alt="Add credentials to Jenkins"></p></li>
    <li>Add the ssh key into the credentials shown the picture below. <p><img src="https://github.com/patrik93/devsecops-sample/blob/master/images/add-ssh-key.png" alt="Add SSH key creds to Jenkins"></p></li>
    <li>Add the SonarQube access token key (created in SonarQube section) into the credentials shown the picture below. <p><img src="https://github.com/patrik93/devsecops-sample/blob/master/images/sonarqube-server-token.png" alt="Add SonarQube access key creds to Jenkins"></p></li>
    <li>At the home page click on New item type your pipeline name e.g. "first-pipeline" and select Pipeline type for your item.</li>
    <li>In the Pipeline section select <i>"Pipeline from SCM"</i> from the Definition drop-down list and add your repository address, where your Jenkinsfile located. Click on save.</li>
    <li>At the <i>"Manage Jenkins" -> "Configure System"</i> scroll to the SonarQube servers section. Make sure, you checked <i>"Environment variables"</i>. At the Server authentication token choose the previously added credentials. <p><img src="https://github.com/patrik93/devsecops-sample/blob/master/images/add-sonarqube-jenkins.png" alt="Add SonarQube server to Jenkins"></p></li>
</ol>


<h2>TODO list:</h2>

1. [x] Jenkins setup guide with plugins and credentials (SSH Agent, SonarQube).
2. [x] Add SonarQube as Static Application Security Testing (SAST).
2. [x] SonarQube setup guide.
3. [ ] SonarQube Quality Gate setups to break build if the code is vulnerable.
3. [ ] Terraform modification for complete infrastructure (SG, Subnets etc.).
4. [ ] Add Source Compositon Analysis (SCA) solution to the project.
5. [x] Add ZAP to the project as Dynamic Application Security Testing (DAST).
6. [ ] Deployment to any container environment instead of a single Tomcat host.
7. [ ] Container security solution integration in the pipeline.
