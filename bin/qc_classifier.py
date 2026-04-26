import sys
vcf = sys.argv[1]

count = 0

with open(vcf) as f:
    for line in f:
        if not line.startswith("#"):
            count += 1

if count < 10:
    status = "FAIL"
elif count < 50:
    status = "FLAG"
else:
    status = "PASS"

print(f"Variants: {count}")
print(f"QC Status: {status}")


