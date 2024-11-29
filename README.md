
# Hướng Dẫn Cấu Hình AWS CLI và Triển Khai Terraform

## Bước 1: Đăng nhập bằng Access Key trên AWS CLI

1. Mở terminal hoặc command prompt.
2. Chạy lệnh sau để cấu hình AWS CLI:
   ```bash
   aws configure
   ```
3. Nhập các thông tin sau khi được yêu cầu:
   - **Access Key ID**: `access_key`
   - **Secret Access Key**: `secret_key`
   - **Default Region**: `region`

Ví dụ:
```bash
AWS Access Key ID [None]: access_key
AWS Secret Access Key [None]: secret_key
Default region name [None]: region
Default output format [None]: json
```
## Bước 2: Khởi tạo các giá trị của biến
1. Chạy lệnh để khởi tạo file lưu trữ giá trị biến
   ```bash
   touch terraform.tfvars
   ```
2. Nhập các giá trị của biến
   ```bash
  environment = 
  owner =
  region = 
  cidr_block = 
  enable_dns_hostnames = 
  enable_dns_support =
  public_cidr_block = 
  private_cidr_block = 
  availability_zone = 
  MyIP = 
  myVPC = 
  key_name = 
  instance_type = 
  associate_public_ip_address = 
   ```
## Bước 3: Khởi tạo Terraform

1. Di chuyển vào thư mục chứa file cấu hình Terraform (`.tf`).
2. Chạy lệnh sau để khởi tạo Terraform:
   ```bash
   terraform init
   ```

## Bước 4: Kiểm tra kế hoạch triển khai

1. Chạy lệnh sau để kiểm tra kế hoạch triển khai Terraform với file biến `terraform-dev.tfvars`:
   ```bash
   terraform plan 
   ```

## Bước 5: Triển khai cơ sở hạ tầng

1. Chạy lệnh sau để thực hiện triển khai với file biến `terraform-dev.tfvars`:
   ```bash
   terraform apply 
   ```

## Ghi chú:
- Đảm bảo bạn đã cài đặt **AWS CLI** và **Terraform** trên hệ thống.
- Kiểm tra kết nối và quyền truy cập AWS trước khi thực hiện.
