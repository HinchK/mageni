# SPDX-FileCopyrightText: 2023 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.885126");
  script_cve_id("CVE-2023-43615");
  script_tag(name:"creation_date", value:"2023-11-05 02:18:42 +0000 (Sun, 05 Nov 2023)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-10-12 18:16:08 +0000 (Thu, 12 Oct 2023)");

  script_name("Fedora: Security Advisory (FEDORA-2023-0352951853)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2023 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2023-0352951853");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2023-0352951853");
  script_xref(name:"URL", value:"https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.5");
  script_xref(name:"URL", value:"https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2023-10-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'mbedtls' package(s) announced via the FEDORA-2023-0352951853 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"- Update to 2.28.5
- CVE-2023-43615

Release notes: [link moved to references]

Security Advisory: [link moved to references]");

  script_tag(name:"affected", value:"'mbedtls' package(s) on Fedora 39.");

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

  if(!isnull(res = isrpmvuln(pkg:"mbedtls", rpm:"mbedtls~2.28.5~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"mbedtls-debuginfo", rpm:"mbedtls-debuginfo~2.28.5~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"mbedtls-debugsource", rpm:"mbedtls-debugsource~2.28.5~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"mbedtls-devel", rpm:"mbedtls-devel~2.28.5~1.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"mbedtls-doc", rpm:"mbedtls-doc~2.28.5~1.fc39", rls:"FC39"))) {
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
