u:Gem::Specification�[I"1.8.23:ETiI"atomic; TU:Gem::Version[I"
1.1.2; TIu:	Time�L�    :@_zoneI"UTC; TI"DAn atomic reference implementation for JRuby, Rubinius, and MRI; TU:Gem::Requirement[[[I">=; TU;[I"0; TU;	[[[I">=; TU;[I"0; TI"	ruby; F[ 0[I"headius@headius.com; TI"mental@rydia.net; TI"funny.falcon@gmail.com; T[I"Charles Oliver Nutter; TI"MenTaLguY; TI"Sokolov Yura; TI"�
Changes in version 1.1.2:

f519385 Attempting to get description to look nice on rubygems.org.

&lt;p&gt;atomic: An atomic reference implementation for JRuby, Rubinius, and MRI.&lt;/p&gt;

&lt;h1 id="summary"&gt;Summary&lt;/h1&gt;

&lt;p&gt;This library provides:&lt;/p&gt;

&lt;ul&gt;
  &lt;li&gt;an Atomic class that guarantees atomic updates to its contained value&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;The Atomic class provides accessors for the contained “value” plus two update
methods:&lt;/p&gt;

&lt;ul&gt;
  &lt;li&gt;update will run the provided block, passing the current value and replacing
it with the block result iff the value has not been changed in the mean time.
It may run the block repeatedly if there are other concurrent updates in
progress.&lt;/li&gt;
  &lt;li&gt;try_update will run the provided block, passing the current value and
replacing it with the block result. If the value changes before the update
can happen, it will throw Atomic::ConcurrentUpdateError.&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;The atomic repository is at http://github.com/headius/ruby-atomic.&lt;/p&gt;

&lt;h1 id="usage"&gt;Usage&lt;/h1&gt;

&lt;p&gt;The simplest way to use “atomic” is to call the “update” or “try_update”
methods.&lt;/p&gt;

&lt;p&gt;“try_update” and “update” both call the given block, passing the current
value and using the block’s result as the new value. If the value is updated
by another thread before the block completes, “try update” raises a
ConcurrentUpdateError and “update” retries the block. Because “update” may call
the block several times when multiple threads are all updating the same value,
the block’s logic should be kept as simple as possible.&lt;/p&gt;

&lt;p&gt;````ruby
require ‘atomic’&lt;/p&gt;

&lt;p&gt;my_atomic = Atomic.new(0)
my_atomic.update {|v| v + 1}
begin
  my_atomic.try_update {|v| v + 1}
rescue Atomic::ConcurrentUpdateError =&amp;gt; cue
  # deal with it (retry, propagate, etc)
end
````&lt;/p&gt;

&lt;p&gt;It’s also possible to use the regular get/set operations on the Atomic, if you
want to avoid the exception and respond to contended changes in some other way.&lt;/p&gt;

&lt;p&gt;&lt;code&gt;ruby
my_atomic = Atomic.new(0)
my_atomic.value # =&amp;gt; 0
my_atomic.value = 1
my_atomic.swap(2) # =&amp;gt; 1
my_atomic.compare_and_swap(2, 3) # =&amp;gt; true, updated to 3
my_atomic.compare_and_swap(2, 3) # =&amp;gt; false, current is not 2
&lt;/code&gt;&lt;/p&gt;

&lt;h1 id="building"&gt;Building&lt;/h1&gt;

&lt;p&gt;As of 1.1.0, JDK8 is required to build the atomic gem, since it attempts to use
the new atomic Unsafe.getAndSetObject method only in JDK8. The resulting code
should still work fine as far back as Java 5.&lt;/p&gt;

; TI"*http://github.com/headius/ruby-atomic; TT@[ 