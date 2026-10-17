# AWS High Availability Web Server

## Project overview
This project demonstrates a highly available web-server setup on Amazon Web Services (AWS). An internet-facing Application Load Balancer (ALB) distributes HTTP requests to EC2 web servers registered in a target group. The servers are placed in separate Availability Zones to reduce dependence on a single server or zone.

## Objectives
- Deploy two EC2 web servers in separate Availability Zones.
- Serve a simple web page from each server.
- Use an Application Load Balancer to distribute HTTP traffic.
- Use target-group health checks to identify healthy targets.
- Demonstrate the intended failover behavior by stopping one server and checking that the other can still serve requests.

## AWS services and configuration
- Region: Asia Pacific (Sydney), `ap-southeast-2`
- VPC: `HA-WebServer-VPC`, CIDR `10.0.0.0/16`
- Public subnet 1: `10.0.1.0/24` in `ap-southeast-2a`
- Public subnet 2: `10.0.2.0/24` in `ap-southeast-2b`
- Internet Gateway and public route `0.0.0.0/0`
- EC2: Amazon Linux 2023, `t3.micro` (two instances)
- Web server: Apache HTTP Server (`httpd`), HTTP port 80
- Target group: `HA-WebServer-TG`, HTTP port 80, health-check path `/`
- Load balancer: internet-facing Application Load Balancer, HTTP listener port 80

## Architecture
Internet → Application Load Balancer → Target Group → EC2 Web Server 1 (AZ `ap-southeast-2a`) and EC2 Web Server 2 (AZ `ap-southeast-2b`).

The editable PowerPoint architecture diagram is in `docs/HA_WebServer_Architecture_Editable_PPT.pptx`.

## Web server startup scripts
The scripts in `user-data/` install Apache and create distinct pages for Server 1 and Server 2. They are included for reproducibility and documentation.

## Rebuild / test outline
1. Start both EC2 instances.
2. Confirm that the Apache service is running and each instance responds over HTTP.
3. Recreate an internet-facing ALB in the same VPC, selecting both public subnets.
4. Configure an HTTP:80 listener to forward requests to `HA-WebServer-TG`.
5. Register both instances on port 80 in the target group.
6. Wait until both target health statuses are `Healthy`.
7. Open the ALB DNS name and record which server responds.
8. Stop one EC2 instance and wait for the target group to mark it unhealthy.
9. Refresh the ALB DNS page and verify the remaining healthy server responds.
10. Capture screenshots and record the actual observed results in the report.

## Team
- Anwar Azeez — 44111033
- Saajnesh — 44111086

## Repository contents
- `docs/` — architecture diagram and report template
- `screenshots/` — place actual AWS console and browser screenshots here
- `user-data/` — EC2 startup scripts
