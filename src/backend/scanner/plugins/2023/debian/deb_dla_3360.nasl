# Copyright (C) 2023 Greenbone Networks GmbH
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.1.2.2023.3360");
  script_cve_id("CVE-2021-30151", "CVE-2022-23837");
  script_tag(name:"creation_date", value:"2023-03-13 04:23:52 +0000 (Mon, 13 Mar 2023)");
  script_version("2023-03-13T10:10:16+0000");
  script_tag(name:"last_modification", value:"2023-03-13 10:10:16 +0000 (Mon, 13 Mar 2023)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2022-01-28 02:32:00 +0000 (Fri, 28 Jan 2022)");

  script_name("Debian: Security Advisory (DLA-3360)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2023 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB10");

  script_xref(name:"Advisory-ID", value:"DLA-3360");
  script_xref(name:"URL", value:"https://www.debian.org/lts/security/2023/dla-3360");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/ruby-sidekiq");
  script_xref(name:"URL", value:"https://wiki.debian.org/LTS");

  script_tag(name:"summary", value:"The remote host is missing an update for the Debian 'ruby-sidekiq' package(s) announced via the DLA-3360 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"ruby-sidekiq, a simple, efficient background processing for Ruby, had a couple of vulnerabilities as follows:

CVE-2021-30151

Sidekiq allows XSS via the queue name of the live-poll feature when Internet Explorer is used.

CVE-2022-23837

In api.rb in Sidekiq, there is no limit on the number of days when requesting stats for the graph. This overloads the system, affecting the Web UI, and makes it unavailable to users.

For Debian 10 buster, these problems have been fixed in version 5.2.3+dfsg-1+deb10u1.

We recommend that you upgrade your ruby-sidekiq packages.

For the detailed security status of ruby-sidekiq please refer to its security tracker page at: [link moved to references]

Further information about Debian LTS security advisories, how to apply these updates to your system and frequently asked questions can be found at: [link moved to references]");

  script_tag(name:"affected", value:"'ruby-sidekiq' package(s) on Debian 10.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "DEB10") {

  if(!isnull(res = isdpkgvuln(pkg:"ruby-sidekiq", ver:"5.2.3+dfsg-1+deb10u1", rls:"DEB10"))) {
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
