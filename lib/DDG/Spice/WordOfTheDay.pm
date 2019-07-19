package DDG::Spice::WordOfTheDay;

# ABSTRACT: Show the word of the day, provided by the Wornik API

use DDG::Spice;

spice is_cached => 1;
spice proxy_cache_valid => "200 1d";
spice wrap_jsonp_callback => 1;
spice content_type_javascript => 1;

spice to => 'http://api.wordnik.com/v4/words.json/wordOfTheDay?api_key={{ENV{DDG_SPICE_WORDNIK_APIKEY}}}';

triggers start =>
    'word of the day',
    'dictionary word of the day',
    'word of the day dictionary',
    'what is the word of the day';

handle remainder => sub {
    return unless $_ eq '';
    return $_;
};

1;
