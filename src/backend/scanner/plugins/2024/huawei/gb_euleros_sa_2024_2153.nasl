# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.2.2024.2153");
  script_cve_id("CVE-2024-4418");
  script_tag(name:"creation_date", value:"2024-08-20 04:40:56 +0000 (Tue, 20 Aug 2024)");
  script_version("2024-08-20T05:05:37+0000");
  script_tag(name:"last_modification", value:"2024-08-20 05:05:37 +0000 (Tue, 20 Aug 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("Huawei EulerOS: Security Advisory for libvirt (EulerOS-SA-2024-2153)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Huawei EulerOS Local Security Checks");
  script_dependencies("gb_huawei_euleros_consolidation.nasl");
  script_mandatory_keys("ssh/login/euleros", "ssh/login/rpms", re:"ssh/login/release=EULEROSVIRT\-2\.10\.1");

  script_xref(name:"Advisory-ID", value:"EulerOS-SA-2024-2153");
  script_xref(name:"URL", value:"https://developer.huaweicloud.com/intl/en-us/euleros/securitydetail.html?secId=EulerOS-SA-2024-2153");

  script_tag(name:"summary", value:"The remote host is missing an update for the Huawei EulerOS 'libvirt' package(s) announced via the EulerOS-SA-2024-2153 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"A race condition leading to a stack use-after-free flaw was found in libvirt. Due to a bad assumption in the virNetClientIOEventLoop() method, the `data` pointer to a stack-allocated virNetClientIOEventData structure ended up being used in the virNetClientIOEventFD callback while the data pointer's stack frame was concurrently being 'freed' when returning from virNetClientIOEventLoop(). The 'virtproxyd' daemon can be used to trigger requests. If libvirt is configured with fine-grained access control, this issue, in theory, allows a user to escape their otherwise limited access. This flaw allows a local, unprivileged user to access virtproxyd without authenticating. Remote users would need to authenticate before they could access it.(CVE-2024-4418)");

  script_tag(name:"affected", value:"'libvirt' package(s) on Huawei EulerOS Virtualization release 2.10.1.");

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

if(release == "EULEROSVIRT-2.10.1") {

  if(!isnull(res = isrpmvuln(pkg:"libvirt", rpm:"libvirt~6.2.0~2.10.0.5.406", rls:"EULEROSVIRT-2.10.1"))) {
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
