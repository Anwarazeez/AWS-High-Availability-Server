
# AWS High Availability Web Server — Project Report

## 1. Abstract
This project demonstrates a web hosting setup using two Amazon EC2 instances in separate Availability Zones. An Application Load Balancer distributes incoming HTTP requests across registered targets and uses health checks to identify available servers.

## 2. Problem Statement
A single web server can become unavailable due to instance or application failure. Using multiple servers behind a load balancer can help maintain access when one server becomes unavailable.

## 3. Objectives
- Configure a VPC with two public subnets.
- Deploy two EC2 web servers in separate Availability Zones.
- Install Apache HTTP Server on both servers.
- Configure an Application Load Balancer and target group.
- Test server health and failover behavior.

## 4. AWS Configuration
- Region: ap-southeast-2 (Sydney)
- VPC: HA-WebServer-VPC
- VPC CIDR: 10.0.0.0/16
- Subnet 1: 10.0.1.0/24
- Subnet 2: 10.0.2.0/24
- EC2 operating system: Amazon Linux 2023
- Instance type: t3.micro
- Web server: Apache HTTP Server
- HTTP port: 80
- Target group: HA-WebServer-TG

## 5. Architecture
Internet → Application Load Balancer → Target Group → EC2 Server 1 and EC2 Server 2.

Insert or reference the architecture diagram stored in this folder.

## 6. Implementation
The VPC, subnets, Internet Gateway, route table, security group, EC2 instances, and target group were configured using the AWS Management Console. Apache was configured to display a different webpage on each server.

The Application Load Balancer was created with an HTTP listener and configured to forward requests to the target group.

## 7. Testing and Results
- ALB DNS webpage: Successfully opened during the initial test.
- Target health: Verify and record the actual result.
- Failover test: Pending verification unless completed and supported by evidence.

Insert actual screenshots and update these results before submission.

## 8. Conclusion
This project demonstrates how multiple EC2 instances and an Application Load Balancer can be used to improve web application availability. The final conclusion should reflect the results of the tests actually performed.

## 9. Team Members
- Anwar Azeez — 44111033
- Saajnesh — 44111086
