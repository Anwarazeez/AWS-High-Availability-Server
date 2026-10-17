# Project Report — AWS High Availability Web Server

## 1. Abstract
This project demonstrates a web application hosted on two Amazon EC2 instances in separate Availability Zones. An Application Load Balancer distributes HTTP requests to registered targets and uses health checks to identify available web servers.

## 2. Problem statement
A single web server can become unavailable due to instance or application failure. A design with multiple targets and a load balancer can improve availability by routing requests to healthy targets.

## 3. Objectives
- Configure a VPC with two public subnets in separate Availability Zones.
- Deploy two Apache web servers on EC2.
- Configure an Application Load Balancer and target group.
- Observe target health and test the intended failover behavior.

## 4. Architecture
Internet → ALB (HTTP:80) → Target Group (HTTP:80, health check `/`) → EC2 Server 1 and EC2 Server 2 in separate Availability Zones.

Insert the architecture diagram from `HA_WebServer_Architecture_Editable_PPT.pptx` here.

## 5. Implementation
Document the VPC, subnets, Internet Gateway, route table, security groups, EC2 configuration, Apache pages, target group, and ALB listener. Add actual screenshots in the relevant sections.

## 6. Testing and results
- [ ] Both EC2 instances deployed in separate Availability Zones.
- [ ] Each web server page opened successfully.
- [ ] ALB DNS page opened successfully.
- [ ] Both target-group targets showed Healthy.
- [ ] One instance stopped for the failover test.
- [ ] ALB continued serving the page through the remaining healthy target.

**Status:** Fill in each checkbox only after verifying it. Add the date, screenshots, and actual result. The failover test is not confirmed by this template.

## 7. Conclusion
The setup illustrates how an Application Load Balancer and multiple EC2 targets can support a more available web service. The final conclusion should reflect the tests actually completed.

## 8. Team members
- Anwar Azeez — 44111033
- Saajnesh — 44111086
