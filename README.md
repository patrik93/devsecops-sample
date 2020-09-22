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
</ol>

<h2>Warning</h2>
<p>Starting infrastructure described in Terraform template will cost $0.05 per hour. SonarQube not able to run on t2.micro free tier eligible instance due to low resources. Every other components of the project is free tier eligible.</p>

<h2>Setup</h2>



<h2>TODO:</h2>
<ul>
    <li>Jenkins setup guide with plugins and credentials (sshagent, sonarqube)</li>
    <li>Sonarqube setup guide, quality gate setups on vulnerable code.</li>
</ul>
