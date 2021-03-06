u:Gem::Specification�[I"1.8.24:ETiI"atomic; TU:Gem::Version[I"
1.1.8; TIu:	Time N�    :@_zoneI"UTC; TI"DAn atomic reference implementation for JRuby, Rubinius, and MRI; TU:Gem::Requirement[[[I">=; TU;[I"0; TU;	[[[I">=; TU;[I"0; TI"	java; T[ 0[I"headius@headius.com; TI"mental@rydia.net; TI"funny.falcon@gmail.com; T[I"Charles Oliver Nutter; TI"MenTaLguY; TI"Sokolov Yura; TI"z= An atomic reference implementation for JRuby, Rubinius, and MRI.


== Changes since 1.1.7

* 0b1cd2d Add license to gemspec.
* e8d43f1 Limit gem description to just commit log.
* 6869b89 Version 1.1.8.
* ed84820 Add numeric CAS logic for fallback, MRI, and Rubinius.
* 40eca8e Make test work under 1.8-compat.
* b6398e5 Add some missing license headers.
* c291231 Allow forcing fallback impl.
* 6c2ce92 Fix #21 by moving win32 CFLAGS tweak above other test compiles.
* e59e92b Add CAS tests for more numeric types.
* 0749145 Add pkg/ and *.gem to gitignore.
* 073b4c1 Partial fix for numeric idempotence differences across Rubies.

; TI"*http://github.com/headius/ruby-atomic; TTo:Gem::Platform:	@cpu0:@osI"	java; F:@version0[I"Apache-2.0; T