import { BmiCalculatorFrontPage } from './app.po';

describe('bmi-calculator-front App', () => {
  let page: BmiCalculatorFrontPage;

  beforeEach(() => {
    page = new BmiCalculatorFrontPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
