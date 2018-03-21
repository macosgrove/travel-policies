# travel-policies

## Card

As a traveller
I want to know how much my travel policy will cost me
So that I can decide whether to purchase one

## Conversation

MAC goes to speak to the business analyst, Sarah.

MAC: I see that the cost of the policy depends on the length of the trip and the age of the traveller.
Thanks for giving me that table. I have a couple of questions about it.

Sarah: Fire away!

MAC: What if the trip is less than a full day in length - say it's a business trip 
from Sydney to Canberra and they return in the same day?

Sarah: Oh yeah. We do cover those. That table should say 0-7 days. But that might be confusing to the
traveller, so the label on the form should say "Up to 7 days".

MAC: Sure, thanks. Do we cover travellers under the age of 18?

Sarah: No we don't. If they say they're under 18 then we should display an error message
saying "Sorry, travellers under the age of 18 are not covered by our policy".

MAC: And what about travellers over the age of 69?

Sarah: They aren't covered either. Give them a similar error message please.

MAC: How often do the prices of our policies change?

Sarah: They're updated quarterly.

MAC: Is it OK to require intervention by a developer and a deploy to update those?

Sarah: For now, that's a reasonable solution. Later we'll provide an interface where an administrator can update them.

MAC: I see all of those prices are whole dollar amounts. Is it possible that we'll want dollar and cent amounts later?

Sarah: Yes, that's likely with our next update.

MAC: What currency are those prices in?

Sarah: Those are AUD.

MAC: Are we likely to want to use prices in other currencies in the near future?

Sarah: Yes, we're hoping to sell policies globally soon. Best allow for multiple currencies, though we only need AUD for now. 
And we may also want to translate the page to other languages.

MAC: Do those prices include GST or other taxes?

Sarah: We'll be applying taxes in a later story. You can ignore them for now.

MAC: Do you need any company logo or other visual niceties on the page?

Sarah: No, we have a later story for making the page visually appealing.

MAC: That's all I have for now. Thanks for your time!

Sarah: No worries, see you later :-)

## Confirmation

* Trips can be any number of days in length from 0 up.
* Travellers must be between the ages of 18 and 69. Other ages provide an error message.
* Prices can have cents and a currency. Only AUD is required for now.
* Prices may be hardcoded for now.
* Taxes may be ignored for now
* User interface strings are only English for now but must be translatable
* User interface can be basic for now.
