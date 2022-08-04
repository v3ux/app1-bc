codeunit 50000 "HelloWorld Test"
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler')]
    procedure TestHelloWorldMessage()
    var
        CustList: TestPage "Customer List";
    begin
        MessageDisplayed := false;

        CustList.OpenView();
        if (not MessageDisplayed) then
            ERROR('No message or wrong message was displayed!');

        CustList.Close();
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        if (StrLen(Message) = 0) then
            ERROR('Message was empty!');

        MessageDisplayed := MessageDisplayed or (Message = 'App published: Hello world - Aries');
    end;

    var
        MessageDisplayed: Boolean;
}
