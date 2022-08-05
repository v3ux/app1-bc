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
        CustList.Close();
        if (not MessageDisplayed) then
            ERROR('No message or wrong message was displayed!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        MessageDisplayed := MessageDisplayed or (Message = 'App published: Hello world - Aries');
    end;

    var
        MessageDisplayed: Boolean;
}
