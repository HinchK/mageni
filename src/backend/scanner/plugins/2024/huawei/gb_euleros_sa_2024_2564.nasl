# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.2.2024.2564");
  script_cve_id("CVE-2023-29483");
  script_tag(name:"creation_date", value:"2024-10-09 04:31:34 +0000 (Wed, 09 Oct 2024)");
  script_version("2024-10-09T08:09:35+0000");
  script_tag(name:"last_modification", value:"2024-10-09 08:09:35 +0000 (Wed, 09 Oct 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("Huawei EulerOS: Security Advisory for python-dns (EulerOS-SA-2024-2564)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Huawei EulerOS Local Security Checks");
  script_dependencies("gb_huawei_euleros_consolidation.nasl");
  script_mandatory_keys("ssh/login/euleros", "ssh/login/rpms", re:"ssh/login/release=EULEROS\-2\.0SP11");

  script_xref(name:"Advisory-ID", value:"EulerOS-SA-2024-2564");
  script_xref(name:"URL", value:"https://developer.huaweicloud.com/intl/en-us/euleros/securitydetail.html?secId=EulerOS-SA-2024-2564");

  script_tag(name:"summary", value:"The remote host is missing an update for the Huawei EulerOS 'python-dns' package(s) announced via the EulerOS-SA-2024-2564 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"eventlet before 0.35.2, as used in dnspython before 2.6.0, allows remote attackers to interfere with DNS name resolution by quickly sending an invalid packet from the expected IP address and source port, aka a 'TuDoor' attack. In other words, dnspython does not have the preferred behavior in which the DNS name resolution algorithm would proceed, within the full time window, in order to wait for a valid packet. NOTE: dnspython 2.6.0 is unusable for a different reason that was addressed in 2.6.1.(CVE-2023-29483)");

  script_tag(name:"affected", value:"'python-dns' package(s) on Huawei EulerOS V2.0SP11.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "EULEROS-2.0SP11") {

  if(!isnull(res = isrpmvuln(pkg:"python3-dns", rpm:"python3-dns~2.1.0~2.h1.eulerosv2r11", rls:"EULEROS-2.0SP11"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

exit(0);
