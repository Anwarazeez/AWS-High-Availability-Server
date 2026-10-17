
# AWS High Availability Web Server

## 1. Project Overview

This project demonstrates a highly available web server setup using Amazon Web Services (AWS). An internet-facing Application Load Balancer (ALB) distributes HTTP requests to EC2 web servers registered in a target group. The servers are deployed across two Availability Zones to reduce dependence on a single server.

## 2. Objectives

- Deploy two EC2 web servers in separate Availability Zones.
- Host a simple webpage on each server using Apache HTTP Server.
- Configure an Application Load Balancer to distribute HTTP traffic.
- Use target-group health checks to identify healthy targets.
- Test whether the application remains accessible when one server becomes unavailable.

## 3. AWS Services and Configuration

- **AWS Region:** Asia Pacific (Sydney) — `ap-southeast-2`
- **VPC:** `HA-WebServer-VPC` — `10.0.0.0/16`
- **Public Subnet 1:** `10.0.1.0/24` — `ap-southeast-2a`
- **Public Subnet 2:** `10.0.2.0/24` — `ap-southeast-2b`
- **Networking:** Internet Gateway, public route table and subnet associations
- **Compute:** Two Amazon Linux 2023 EC2 instances using `t3.micro`
- **Web Server:** Apache HTTP Server (`httpd`), port 80
- **Target Group:** `HA-WebServer-TG`, HTTP port 80, health-check path `/`
- **Load Balancer:** Internet-facing Application Load Balancer with an HTTP listener on port 80

## 4. Architecture

Internet → Application Load Balancer → Target Group → EC2 Web Server 1 and EC2 Web Server 2.

- Server 1 is deployed in `ap-southeast-2a`.
- Server 2 is deployed in `ap-southeast-2b`.
- The target group monitors the health of registered instances.
- The ALB should route requests to healthy targets.

The editable architecture diagram is available in `HA_WebServer_Architecture_Editable_PPT.pptx` in the repository root.

## 5. Implementation

The project was configured using the AWS Management Console. The VPC, public subnets, Internet Gateway, route table, security group, EC2 instances and target group were created for the deployment.

Apache was configured on both instances, with a different webpage identifying each server. An Application Load Balancer was created and its DNS address was used to access the web application.

## 6. Rebuild and Testing Procedure

1. Start both EC2 instances.
2. Verify that Apache is running on both instances.
3. Recreate the internet-facing ALB using both public subnets.
4. Configure an HTTP listener on port 80 to forward requests to `HA-WebServer-TG`.
5. Register both instances on port 80.
6. Wait until both targets report `Healthy`.
7. Open the ALB DNS address and record the displayed server.
8. Stop one EC2 instance and wait for its target health to change.
9. Refresh the ALB DNS page and verify whether the remaining healthy server responds.
10. Save screenshots and record the actual test results.

## 7. Test Results

- Initial access through the ALB DNS address: **Successful**.
- Health status of both targets: **Update after verification**.
- Failover after stopping one instance: **Pending verification**.

Only update these results after checking the corresponding AWS resources and screenshots.

## 8. Repository Contents

- `README.md` — Project overview, configuration and testing procedure
- `HA_WebServer_Architecture_Editable_PPT.pptx` — Editable architecture diagram
- `Project_Report_Template.md` — Report template
- `Screenshot ... .png` — AWS console and browser evidence
- `server-1-user-data.sh` and `server-2-user-data.sh` — Startup scripts, if present in the repository

## 9. Team Members

- Anwar Azeez — 44111033
- Saajnesh — 44111086

## 10. Conclusion

This project demonstrates the design of a web application using multiple EC2 instances and an Application Load Balancer. The setup illustrates how distributing requests across healthy targets can improve availability. The final conclusion should be based on the failover test results actually observed.
