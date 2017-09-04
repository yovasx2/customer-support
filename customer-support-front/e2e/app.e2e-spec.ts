import { CustomerSupportFrontPage } from './app.po';

describe('customer-support-front App', () => {
  let page: CustomerSupportFrontPage;

  beforeEach(() => {
    page = new CustomerSupportFrontPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
