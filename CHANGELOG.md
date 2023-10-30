# Changelog

## [1.8.0](https://github.com/containrrr/shepherd/tree/1.8.0) (2023-10-30)

[Full Changelog](https://github.com/containrrr/shepherd/compare/0.7.0...1.8.0)

**Breaking changes:**

- The docker image registry location has been changed to the containrrr organisation:
  `containrrr/shepherd`

**Implemented enhancements:**

- armhf support [\#108](https://github.com/containrrr/shepherd/issues/108)
- Switch to official docker image v24 [\#107](https://github.com/containrrr/shepherd/pull/107) ([djmaze](https://github.com/djmaze))
- Restrict runtime of "docker service update" using "timeout" [\#98](https://github.com/containrrr/shepherd/pull/98) ([fooflington](https://github.com/fooflington))
- Add example for usage with swarm-cronjob [\#89](https://github.com/containrrr/shepherd/pull/89) ([djmaze](https://github.com/djmaze))

**Fixed bugs:**

- Can't update some services: no such manifest [\#105](https://github.com/containrrr/shepherd/issues/105)
- Service gets stuck when calling "docker service update" and won't progress [\#97](https://github.com/containrrr/shepherd/issues/97)
- fix: docker service update with `--detach=false` hangs on services wi… [\#104](https://github.com/containrrr/shepherd/pull/104) ([AliRezaBeitari](https://github.com/AliRezaBeitari))
- Fix defunc VERBOSE handling [\#91](https://github.com/containrrr/shepherd/pull/91) ([sebthom](https://github.com/sebthom))

**Closed issues:**

- How does it determine if there is an update or not? [\#111](https://github.com/containrrr/shepherd/issues/111)
- Looking for a new maintainer [\#96](https://github.com/containrrr/shepherd/issues/96)
- New OCI manifest issue [\#92](https://github.com/containrrr/shepherd/issues/92)
- Run service update at a fixed time [\#88](https://github.com/containrrr/shepherd/issues/88)
- docker swarm 20.10.12 | "docker service update" requires exactly 1 argument. [\#83](https://github.com/containrrr/shepherd/issues/83)
- Error updating service, does not exist or it is not available when using a duplicate registry [\#78](https://github.com/containrrr/shepherd/issues/78)

**Merged pull requests:**

- Add apprise type and additional error notification [\#118](https://github.com/containrrr/shepherd/pull/118) ([andyloree](https://github.com/andyloree))
- Rename image in docs [\#114](https://github.com/containrrr/shepherd/pull/114) ([moschlar](https://github.com/moschlar))
- Fix release workflow [\#113](https://github.com/containrrr/shepherd/pull/113) ([moschlar](https://github.com/moschlar))
- Update README.md [\#103](https://github.com/containrrr/shepherd/pull/103) ([andrew-dixon](https://github.com/andrew-dixon))
- ci: add basic github actions for build/release [\#101](https://github.com/containrrr/shepherd/pull/101) ([piksel](https://github.com/piksel))
- correct misleading description of WITH\_NO\_RESOLVE\_IMAGE [\#100](https://github.com/containrrr/shepherd/pull/100) ([alex-vg](https://github.com/alex-vg))
- Move example configs to their own folder [\#99](https://github.com/containrrr/shepherd/pull/99) ([djmaze](https://github.com/djmaze))
- Add documentation about `REGISTRIES_FILE` [\#94](https://github.com/containrrr/shepherd/pull/94) ([tito](https://github.com/tito))
- Minor refactoring [\#90](https://github.com/containrrr/shepherd/pull/90) ([sebthom](https://github.com/sebthom))

## [0.7.0](https://github.com/djmaze/shepherd/tree/0.7.0) (2022-10-03)

[Full Changelog](https://github.com/djmaze/shepherd/compare/0.6.0...0.7.0)

**Implemented enhancements:**

- Add support for specifying UPDATE\_OPTIONS and ROLLBACK\_OPTIONS [\#77](https://github.com/djmaze/shepherd/pull/77) ([moschlar](https://github.com/moschlar))
- Added hostname to output and the possibility to setup a variable for that. [\#72](https://github.com/djmaze/shepherd/pull/72) ([Betriebsrat](https://github.com/Betriebsrat))
- support auth to multiple regs in secret file [\#69](https://github.com/djmaze/shepherd/pull/69) ([rbauduin](https://github.com/rbauduin))
- Add help text and example for setting the timezone [\#68](https://github.com/djmaze/shepherd/pull/68) ([moschlar](https://github.com/moschlar))
- support docker secrets for registry password retrieval [\#67](https://github.com/djmaze/shepherd/pull/67) ([rbauduin](https://github.com/rbauduin))

**Fixed bugs:**

- Fix ignorelist check [\#79](https://github.com/djmaze/shepherd/pull/79) ([djmaze](https://github.com/djmaze))
- Fix shellcheck problems [\#70](https://github.com/djmaze/shepherd/pull/70) ([djmaze](https://github.com/djmaze))

**Closed issues:**

- Enhancement: Hostname or custom text for notifications [\#71](https://github.com/djmaze/shepherd/issues/71)

## [0.6.0](https://github.com/djmaze/shepherd/tree/0.6.0) (2022-01-12)

[Full Changelog](https://github.com/djmaze/shepherd/compare/0.5.0...0.6.0)

**Breaking changes:**

- Renames BLACKLIST\_SERVICES variable [\#58](https://github.com/djmaze/shepherd/pull/58) ([davidCarlos](https://github.com/davidCarlos))

**Implemented enhancements:**

- drone: \(Cross-\)build with buildx [\#65](https://github.com/djmaze/shepherd/pull/65) ([djmaze](https://github.com/djmaze))
- Add support for rolling back on a failed update [\#64](https://github.com/djmaze/shepherd/pull/64) ([andrasmaroy](https://github.com/andrasmaroy))
- Allow configuring a registry login [\#61](https://github.com/djmaze/shepherd/pull/61) ([djmaze](https://github.com/djmaze))
- Add image autocleaner [\#47](https://github.com/djmaze/shepherd/pull/47) ([lebedevilya](https://github.com/lebedevilya))

**Fixed bugs:**

- cap-add NET\_ADMIN [\#62](https://github.com/djmaze/shepherd/issues/62)
- Dockerhub authentication... again [\#60](https://github.com/djmaze/shepherd/issues/60)

**Closed issues:**

- Error docker rmi [\#53](https://github.com/djmaze/shepherd/issues/53)
- Scheduling updates with cron-style schedule [\#46](https://github.com/djmaze/shepherd/issues/46)
- release & versions [\#37](https://github.com/djmaze/shepherd/issues/37)

**Merged pull requests:**

- drone: build PRs as well [\#66](https://github.com/djmaze/shepherd/pull/66) ([djmaze](https://github.com/djmaze))

## [0.5.0](https://github.com/djmaze/shepherd/tree/0.5.0) (2020-06-08)

[Full Changelog](https://github.com/djmaze/shepherd/compare/0.4.0...0.5.0)

**Implemented enhancements:**

- Support of no-resolve-image flag for image update [\#41](https://github.com/djmaze/shepherd/pull/41) ([sadmin91](https://github.com/sadmin91))
- Add time stamp to logs [\#40](https://github.com/djmaze/shepherd/pull/40) ([jnk5y](https://github.com/jnk5y))
- Support of insecure registry [\#38](https://github.com/djmaze/shepherd/pull/38) ([sadmin91](https://github.com/sadmin91))
- Do not kill services if image download fails [\#34](https://github.com/djmaze/shepherd/pull/34) ([andresmoschini](https://github.com/andresmoschini))
- Implement notifications via apprise microservice [\#30](https://github.com/djmaze/shepherd/pull/30) ([andrasmaroy](https://github.com/andrasmaroy))

**Fixed bugs:**

- Add missing json header to sidecar curl command [\#33](https://github.com/djmaze/shepherd/pull/33) ([djmaze](https://github.com/djmaze))

**Closed issues:**

- unauthorized: HTTP Basic: Access denied, [\#43](https://github.com/djmaze/shepherd/issues/43)
- Error response from daemon: This node is not a swarm manager [\#36](https://github.com/djmaze/shepherd/issues/36)
- ---question: reasons for "infinite updating" [\#32](https://github.com/djmaze/shepherd/issues/32)
- Gets stuck on checking an update  [\#31](https://github.com/djmaze/shepherd/issues/31)
- Release update \(0.4.0\) [\#25](https://github.com/djmaze/shepherd/issues/25)
- Update Notification over Slack Channel or Email [\#23](https://github.com/djmaze/shepherd/issues/23)
- CPU spikes [\#20](https://github.com/djmaze/shepherd/issues/20)

**Merged pull requests:**

- Removes extra docker call for the service name [\#27](https://github.com/djmaze/shepherd/pull/27) ([tlex](https://github.com/tlex))

## [0.4.0](https://github.com/djmaze/shepherd/tree/0.4.0) (2019-07-10)

[Full Changelog](https://github.com/djmaze/shepherd/compare/0.3.0...0.4.0)

**Implemented enhancements:**

- Feat: having a whitelist flag [\#18](https://github.com/djmaze/shepherd/issues/18)
- use labels for watch list [\#9](https://github.com/djmaze/shepherd/issues/9)
- Filtering services [\#24](https://github.com/djmaze/shepherd/pull/24) ([mduheaume](https://github.com/mduheaume))
- Misc. updates [\#17](https://github.com/djmaze/shepherd/pull/17) ([tonsV2](https://github.com/tonsV2))
- Feature/show update status [\#15](https://github.com/djmaze/shepherd/pull/15) ([tonsV2](https://github.com/tonsV2))

**Fixed bugs:**

- Services won't automatically re-deploy [\#8](https://github.com/djmaze/shepherd/issues/8)
- Service continuously restarted [\#7](https://github.com/djmaze/shepherd/issues/7)
- Problem with private registry on 17.06 [\#6](https://github.com/djmaze/shepherd/issues/6)
- Typo fix [\#12](https://github.com/djmaze/shepherd/pull/12) ([gvidon](https://github.com/gvidon))

**Closed issues:**

- docker-compose clarification [\#22](https://github.com/djmaze/shepherd/issues/22)

## [0.3.0](https://github.com/djmaze/shepherd/tree/0.3.0) (2018-04-09)

[Full Changelog](https://github.com/djmaze/shepherd/compare/0.2.2...0.3.0)

**Implemented enhancements:**

- Support for private registry authentication [\#10](https://github.com/djmaze/shepherd/pull/10) ([ledermann](https://github.com/ledermann))

## [0.2.2](https://github.com/djmaze/shepherd/tree/0.2.2) (2017-06-03)

[Full Changelog](https://github.com/djmaze/shepherd/compare/0.2...0.2.2)

**Implemented enhancements:**

- Exclude specific services [\#1](https://github.com/djmaze/shepherd/issues/1)

**Fixed bugs:**

- Fixes for 0.2 [\#5](https://github.com/djmaze/shepherd/pull/5) ([djmaze](https://github.com/djmaze))

## [0.2](https://github.com/djmaze/shepherd/tree/0.2) (2017-06-03)

[Full Changelog](https://github.com/djmaze/shepherd/compare/0.2.1...0.2)

## [0.2.1](https://github.com/djmaze/shepherd/tree/0.2.1) (2017-06-03)

[Full Changelog](https://github.com/djmaze/shepherd/compare/0.2.0...0.2.1)

## [0.2.0](https://github.com/djmaze/shepherd/tree/0.2.0) (2017-06-03)

[Full Changelog](https://github.com/djmaze/shepherd/compare/0.1...0.2.0)

**Implemented enhancements:**

- Add blacklisting [\#4](https://github.com/djmaze/shepherd/pull/4) ([djmaze](https://github.com/djmaze))

## [0.1](https://github.com/djmaze/shepherd/tree/0.1) (2017-05-11)

[Full Changelog](https://github.com/djmaze/shepherd/compare/27b26fc95517b781ac6b6a4a19b6c27c971ef77a...0.1)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
