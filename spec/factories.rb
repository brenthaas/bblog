FactoryGirl.define do
	factory :user do
    sequence (:username) { |num| "testuser#{num}" }
    name 'Testington Magee'
    password 'foobar'
	end

	factory :blog do
		title 'Blog Testing Title'
		posting_date Date.new(2001, 9, 11)
		content 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id leo eget diam posuere imperdiet. Nulla enim risus, vestibulum a commodo sed, sollicitudin nec augue. Aenean aliquet felis ac purus vehicula a pulvinar ante dapibus. Morbi laoreet erat vel nunc rhoncus pharetra. Duis porta sollicitudin ultrices. Vivamus ullamcorper, ligula quis venenatis accumsan, magna metus accumsan justo, eget posuere arcu lectus sagittis nunc. Mauris et nibh ligula. Sed ultricies lacinia purus nec rhoncus. Vivamus id tellus vel erat sodales convallis consectetur et diam. Mauris pharetra cursus nunc eget gravida. Aenean magna nulla, ullamcorper a ultrices in, facilisis sit amet lorem. Curabitur sodales lacus in eros ullamcorper ornare. \n Donec arcu mauris, ultrices in euismod ac, dapibus in neque. Duis hendrerit turpis ac metus lobortis sollicitudin. Nulla facilisi. Nam eget orci nisi. Vestibulum nec elit et leo pharetra lacinia. Integer et nulla ligula. Sed consectetur eleifend nibh, eget faucibus sapien imperdiet vitae. Sed blandit feugiat risus ac euismod. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec mattis, lectus eu accumsan iaculis, erat turpis fringilla dui, interdum semper est lacus at odio.'
		user
	end
end
