# gomaster

If you use `godep` you know how frustrating is having your GOPATH messed up by a `godep restore`.
You are not sure which repos are in wich branch, or if you have the version specified by an external Godep.json.

This script will help you to handle these cases.

It will look for all the repos in your GOPATH and check out the master.
After that it will pull the latest changes, so you know that you are at the latest possible change!


```bash
====================   Refreshing   =======================
===
===      https://github.com/rcrowley/go-metrics
===
===========================================================

 -> Checking out master

Already on 'master'
Your branch is up-to-date with 'origin/master'.

 -> Pulling

Already up-to-date.

====================   Refreshing   =======================
===
===      https://github.com/go-kit/kit
===
===========================================================

 -> Checking out master

Already on 'master'
Your branch is up-to-date with 'origin/master'.

 -> Pulling

remote: Counting objects: 47, done.
remote: Compressing objects: 100% (25/25), done.
remote: Total 47 (delta 26), reused 39 (delta 20), pack-reused 2
Unpacking objects: 100% (47/47), done.
From https://github.com/go-kit/kit
   7c0038d..f01651a  master     -> origin/master
Updating 7c0038d..f01651a
Fast-forward
 metrics/cloudwatch/cloudwatch.go      |  41 ++++++++++++++++++++++++-----------------
 metrics/cloudwatch/cloudwatch_test.go |  48 ++++++++++++++++++++++++++++++++++++++++++++++++
 metrics/dogstatsd/dogstatsd.go        | 157 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------
 metrics/dogstatsd/dogstatsd_test.go   |   4 ++--
 sd/endpointer.go                      |   2 +-
 5 files changed, 191 insertions(+), 61 deletions(-)

```
