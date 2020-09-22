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
<ol>
    <p>You can skip these steps if you have already configured Terraform with your AWS account on your machine.</p>
    <li>Setup Terraform on your machine: https://learn.hashicorp.com/tutorials/terraform/install-cli </li>
    <li>Add you AWS account following: https://learn.hashicorp.com/tutorials/terraform/aws-build</li>
    <li>Create AWS ssh key and add its name to the terraform/variables.tf "keyname" variable.
</ol>

<h2>Warning</h2>
<p>Starting infrastructure described in Terraform template will cost $0.05 per hour. SonarQube not able to run on t2.micro free tier eligible instance due to low resources. Every other components of the project is free tier eligible.</p>

<h2>Setup</h2>
<p>Terraform</p>
<ol>    
    <li>After Terraform template applied, you can access created instances with the Terraform output information from the CLI:</li>
    <img src="https://github.com/patrik93/devsecops-sample/blob/master/images/terraform-apply-output?raw=true" alt="Terraform output message">
</ol>
<p>SonarQube</p>
<ol>    
    <li></li>
</ol>
    <p>Jenkins</p>
<ol>    
    <li>You can access Jenkins server by using the printed DNS of started Jenkins server and adding the default port to the url: e.g. http://jenkins-dns:8080</li>
    <li>When you accessed the Web UI, follow the instructions and chose <i>"Install suggested plugins"</i> option.</li>
    <li>At the home page of Jenkins go to "Manage Jenkins" -> "Manage Plugins". On the Available tab, search for "SSH Agent" and "SonarQube Scanner" plugins and install them without restart.</li>
    <li>Add the ssh key into the credentials shown the picture below. <p><img src="https://github.com/patrik93/devsecops-sample/blob/master/images/add-creds-jenkins.png" alt="Add SSH key creds to Jenkins"></p></li>
    <li>Add the SonarQube access token key into the credentials shown the picture below. <p><img src="https://github.com/patrik93/devsecops-sample/blob/master/images/sonarqube-server-token.png" alt="Add SonarQube access key creds to Jenkins"></p></li>
    <li></li>
    <li>At the home page click on New item type your pipeline name e.g. "first-pipeline" and select Pipeline type for your item.</li>
    <li>In the Pipeline section select "Pipeline from SCM" from the Definition drop-down list and add your repository address, where your Jenkinsfile located. Click on save.</li>
    <li>At the "Manage Jenkins" -> "Configure System" scroll to the SonarQube servers section. Make sure, you checked "Environment variables". At the Server authentication token choose the previously added credentials. <p><img src="https://github.com/patrik93/devsecops-sample/blob/master/images/add-sonarqube-jenkins.png" alt="Add SonarQube server to Jenkins"></p></li>
    <li></li>
    <li></li>
</ol>


<h2>TODO:</h2>
<ul>
    <li>Jenkins setup guide with plugins and credentials (sshagent, sonarqube)</li>
    <li>Sonarqube setup guide, quality gate setups on vulnerable code.</li>
</ul>
