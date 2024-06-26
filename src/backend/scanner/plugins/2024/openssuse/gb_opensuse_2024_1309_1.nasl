# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.856077");
  script_version("2024-05-01T05:05:35+0000");
  script_cve_id("CVE-2024-24806", "CVE-2024-27982", "CVE-2024-27983", "CVE-2024-30260", "CVE-2024-30261");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2024-05-01 05:05:35 +0000 (Wed, 01 May 2024)");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:L/A:L");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-02-27 18:34:10 +0000 (Tue, 27 Feb 2024)");
  script_tag(name:"creation_date", value:"2024-04-17 01:01:26 +0000 (Wed, 17 Apr 2024)");
  script_name("openSUSE: Security Advisory for nodejs18 (SUSE-SU-2024:1309-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=(openSUSELeap15\.4|openSUSELeap15\.5)");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:1309-1");
  script_xref(name:"URL", value:"https://lists.opensuse.org/archives/list/security-announce@lists.opensuse.org/thread/GXTLDRGAZLDRT7EH2X45PWE7UAFZNECD");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'nodejs18'
  package(s) announced via the SUSE-SU-2024:1309-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for nodejs18 fixes the following issues:

  Update to 18.20.1

  Security fixes:

  * CVE-2024-27983: Fixed failed assertion in
      node::http2::Http2Session::~Http2Session() that could lead to HTTP/2 server
      crash (bsc#1222244)

  * CVE-2024-27982: Fixed HTTP Request Smuggling via Content Length Obfuscation
      (bsc#1222384)

  * CVE-2024-30260: Fixed proxy-authorization header not cleared on cross-origin
      redirect in undici (bsc#1222530)

  * CVE-2024-30261: Fixed fetch with integrity option is too lax when algorithm
      is specified but hash value is in incorrect in undici (bsc#1222603)

  * CVE-2024-24806: Fixed improper domain lookup that potentially leads to SSRF
      attacks in libuv (bsc#1220053)

  ##");

  script_tag(name:"affected", value:"'nodejs18' package(s) on openSUSE Leap 15.4, openSUSE Leap 15.5.");

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

if(release == "openSUSELeap15.4") {

  if(!isnull(res = isrpmvuln(pkg:"npm18", rpm:"npm18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-devel", rpm:"nodejs18-devel~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18", rpm:"nodejs18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"corepack18", rpm:"corepack18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-debugsource", rpm:"nodejs18-debugsource~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-debuginfo", rpm:"nodejs18-debuginfo~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-docs", rpm:"nodejs18-docs~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"npm18", rpm:"npm18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-devel", rpm:"nodejs18-devel~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18", rpm:"nodejs18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"corepack18", rpm:"corepack18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-debugsource", rpm:"nodejs18-debugsource~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-debuginfo", rpm:"nodejs18-debuginfo~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-docs", rpm:"nodejs18-docs~18.20.1~150400.9.21.3", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "openSUSELeap15.5") {

  if(!isnull(res = isrpmvuln(pkg:"npm18", rpm:"npm18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-devel", rpm:"nodejs18-devel~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18", rpm:"nodejs18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"corepack18", rpm:"corepack18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-debugsource", rpm:"nodejs18-debugsource~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-debuginfo", rpm:"nodejs18-debuginfo~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-docs", rpm:"nodejs18-docs~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"npm18", rpm:"npm18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-devel", rpm:"nodejs18-devel~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18", rpm:"nodejs18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"corepack18", rpm:"corepack18~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-debugsource", rpm:"nodejs18-debugsource~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-debuginfo", rpm:"nodejs18-debuginfo~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"nodejs18-docs", rpm:"nodejs18-docs~18.20.1~150400.9.21.3", rls:"openSUSELeap15.5"))) {
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