# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.2.2024.1828");
  script_cve_id("CVE-2024-31080", "CVE-2024-31081", "CVE-2024-31082", "CVE-2024-31083");
  script_tag(name:"creation_date", value:"2024-06-25 04:14:08 +0000 (Tue, 25 Jun 2024)");
  script_version("2024-06-25T05:05:27+0000");
  script_tag(name:"last_modification", value:"2024-06-25 05:05:27 +0000 (Tue, 25 Jun 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("Huawei EulerOS: Security Advisory for xorg-x11-server (EulerOS-SA-2024-1828)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Huawei EulerOS Local Security Checks");
  script_dependencies("gb_huawei_euleros_consolidation.nasl");
  script_mandatory_keys("ssh/login/euleros", "ssh/login/rpms", re:"ssh/login/release=EULEROS\-2\.0SP11");

  script_xref(name:"Advisory-ID", value:"EulerOS-SA-2024-1828");
  script_xref(name:"URL", value:"https://developer.huaweicloud.com/intl/en-us/euleros/securitydetail.html?secId=EulerOS-SA-2024-1828");

  script_tag(name:"summary", value:"The remote host is missing an update for the Huawei EulerOS 'xorg-x11-server' package(s) announced via the EulerOS-SA-2024-1828 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"A heap-based buffer over-read vulnerability was found in the X.org server's ProcAppleDRICreatePixmap() function. This issue occurs when byte-swapped length values are used in replies, potentially leading to memory leakage and segmentation faults, particularly when triggered by a client with a different endianness. This vulnerability could be exploited by an attacker to cause the X server to read heap memory values and then transmit them back to the client until encountering an unmapped page, resulting in a crash. Despite the attacker's inability to control the specific memory copied into the replies, the small length values typically stored in a 32-bit integer can result in significant attempted out-of-bounds reads.(CVE-2024-31082)

A heap-based buffer over-read vulnerability was found in the X.org server's ProcXIPassiveGrabDevice() function. This issue occurs when byte-swapped length values are used in replies, potentially leading to memory leakage and segmentation faults, particularly when triggered by a client with a different endianness. This vulnerability could be exploited by an attacker to cause the X server to read heap memory values and then transmit them back to the client until encountering an unmapped page, resulting in a crash. Despite the attacker's inability to control the specific memory copied into the replies, the small length values typically stored in a 32-bit integer can result in significant attempted out-of-bounds reads.(CVE-2024-31081)

A use-after-free vulnerability was found in the ProcRenderAddGlyphs() function of Xorg servers. This issue occurs when AllocateGlyph() is called to store new glyphs sent by the client to the X server, potentially resulting in multiple entries pointing to the same non-refcounted glyphs. Consequently, ProcRenderAddGlyphs() may free a glyph, leading to a use-after-free scenario when the same glyph pointer is subsequently accessed. This flaw allows an authenticated attacker to execute arbitrary code on the system by sending a specially crafted request.(CVE-2024-31083)

A heap-based buffer over-read vulnerability was found in the X.org server's ProcXIGetSelectedEvents() function. This issue occurs when byte-swapped length values are used in replies, potentially leading to memory leakage and segmentation faults, particularly when triggered by a client with a different endianness. This vulnerability could be exploited by an attacker to cause the X server to read heap memory values and then transmit them back to the client until encountering an unmapped page, resulting in a crash. Despite the attacker's inability to control the specific memory copied into the replies, the small length values typically stored in a 32-bit integer can result in significant attempted out-of-bounds reads.(CVE-2024-31080)");

  script_tag(name:"affected", value:"'xorg-x11-server' package(s) on Huawei EulerOS V2.0SP11.");

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

  if(!isnull(res = isrpmvuln(pkg:"xorg-x11-server-help", rpm:"xorg-x11-server-help~1.20.11~4.h14.eulerosv2r11", rls:"EULEROS-2.0SP11"))) {
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
