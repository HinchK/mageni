# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.885578");
  script_cve_id("CVE-2023-6879", "CVE-2023-7104", "CVE-2024-0222", "CVE-2024-0223", "CVE-2024-0224", "CVE-2024-0225");
  script_tag(name:"creation_date", value:"2024-01-18 09:16:42 +0000 (Thu, 18 Jan 2024)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-01-05 16:26:26 +0000 (Fri, 05 Jan 2024)");

  script_name("Fedora: Security Advisory (FEDORA-2024-210776b8c7)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-210776b8c7");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2024-210776b8c7");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2256057");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2256199");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2256796");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2256803");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2256809");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2256815");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'chromium' package(s) announced via the FEDORA-2024-210776b8c7 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"update to 120.0.6099.199

 - CVE-2023-6879 aom: heap-buffer-overflow on frame size change
 - CVE-2023-7104 sqlite: heap-buffer-overflow at sessionfuzz
 - CVE-2024-0222: Use after free in ANGLE
 - CVE-2024-0223: Heap buffer overflow in ANGLE
 - CVE-2024-0224: Use after free in WebAudio
 - CVE-2024-0225: Use after free in WebGPU");

  script_tag(name:"affected", value:"'chromium' package(s) on Fedora 39.");

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

if(release == "FC39") {

  if(!isnull(res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~120.0.6099.199~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium", rpm:"chromium~120.0.6099.199~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-common", rpm:"chromium-common~120.0.6099.199~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-common-debuginfo", rpm:"chromium-common-debuginfo~120.0.6099.199~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~120.0.6099.199~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-headless", rpm:"chromium-headless~120.0.6099.199~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"chromium-headless-debuginfo", rpm:"chromium-headless-debuginfo~120.0.6099.199~1.fc39", rls:"FC39"))) {
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
