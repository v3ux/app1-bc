codeunit 50000 "HelloWorld Test"
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler')]
    procedure TestHelloWorldMessage()
    var
        CustList: TestPage "Customer List";
    begin
        CustList.OpenView();
        CustList.Close();
        // if (not MessageDisplayed) then
        //     ERROR('Message was not displayed!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        //MessageDisplayed := MessageDisplayed or (Message = 'App published: Hello world - Aries');
        Assert.IsTrue(StrPos(Message, 'App published: Hello world - Aries') > 0, Message);
    end;

    var
        MessageDisplayed: Boolean;
        Assert: Codeunit Assert;
}
