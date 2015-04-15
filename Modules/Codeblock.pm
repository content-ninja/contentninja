package Modules::Codeblock;

sub new{
	my $class = shift;
	my ($self) = {};
	bless $self, $class;
	return $self;
}

sub replacer{
	my ($self,$val) = @_;
	my $ret = $val =~ s/\{/\&\#123;/eg;
	my $ret = $ret =~ s/\&/\&lt;/eg;
	print "Test: $ret\n";
	return $ret
}

sub run{
	my ($self,$text) = @_;
	# print "Plugin: Codeblock loaded.\n";
	$text =~ s/\{% codeblock.*?%\}(.*?)\{% endcodeblock %\}/<pre class="code"><code class="code">$self->replacer($1)<\/code><\/pre>/gsm;
	return $text;
}

1;
