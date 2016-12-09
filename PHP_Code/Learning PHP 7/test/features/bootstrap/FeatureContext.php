<?php
use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;

use Behat\MinkExtension\Context\MinkContext;

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    /**
     * Click on the element with the provided CSS Selector
     *
     * @When /^I click on xpath "([^"]*)"$/
     */
    public function iClickOnTheElementWithCSSSelector($xpath)
    {
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }

        // ok, let's click on it
        $element->click();

    }

    /**
     * @Given /^I am logged in as "([^"]*)"$/
     */
    public function iAmLoggedInAsUser($user)
    {
        $this->visit('/login');
        $this->fillField('inputEmail', $user);
        $this->fillField('inputPassword', 'test');
        $xpath = '//div[3]//div[2]//div//form//div[3]//div//button';
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        );
        $element->click();
    }

    /**
     * @Given I wait for :sec seconds
     */
    public function iWaitSeconds($seconds)
    {
        sleep($seconds);
    }
}