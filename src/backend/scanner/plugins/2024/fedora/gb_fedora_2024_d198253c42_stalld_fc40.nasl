# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.886458");
  script_version("2024-06-07T05:05:42+0000");
  # TODO: No CVE assigned yet.
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2024-06-07 05:05:42 +0000 (Fri, 07 Jun 2024)");
  script_tag(name:"creation_date", value:"2024-05-27 10:41:15 +0000 (Mon, 27 May 2024)");
  script_name("Fedora: Security Advisory for stalld (FEDORA-2024-d198253c42)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC40");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-d198253c42");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ENLUKBV56WGWTRUT33TN37BL5KVIJEQ2");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'stalld'
  package(s) announced via the FEDORA-2024-d198253c42 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The stalld program monitors the set of system threads,
looking for threads that are ready-to-run but have not
been given processor time for some threshold period.
When a starving thread is found, it is given a temporary
boost using the SCHED_DEADLINE policy. The default is to
allow 10 microseconds of runtime for 1 second of clock time.");

  script_tag(name:"affected", value:"'stalld' package(s) on Fedora 40.");

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

if(release == "FC40") {

  if(!isnull(res = isrpmvuln(pkg:"stalld", rpm:"stalld~1.19.2~1.fc40", rls:"FC40"))) {
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