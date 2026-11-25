@IsTest
private class DemoScenariosControllerTest {

	@IsTest
	static void testScenarioSimpleApexTrigger() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.SIMPLE_APEX_TRIGGER_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.SIMPLE_APEX_TRIGGER_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioDMLResultLogging() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.DML_RESULT_LOGGING_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.DML_RESULT_LOGGING_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioExceptionHandlingWithRelatedRecords() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.EXCEPTION_HANDLING_WITH_RELATED_RECORDS_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.EXCEPTION_HANDLING_WITH_RELATED_RECORDS_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioApexBatchJob() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.APEX_BATCH_JOB_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.APEX_BATCH_JOB_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioApexBatchJobWithCache() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.APEX_BATCH_JOB_WITH_CACHE_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.APEX_BATCH_JOB_WITH_CACHE_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioQueueableAsyncApex() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.QUEUEABLE_ASYNC_APEX_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.QUEUEABLE_ASYNC_APEX_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioApexTriggerAutolaunchedFlow() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.APEX_TRIGGER_AUTOLAUNCHED_FLOW_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.APEX_TRIGGER_AUTOLAUNCHED_FLOW_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioIntegrationErrorLogging() {
		Test.setMock(HttpCalloutMock.class, new ToolingApiMock());
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.INTEGRATION_ERROR_LOGGING_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.INTEGRATION_ERROR_LOGGING_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioFlowIntegration() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.FLOW_INTEGRATION_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.FLOW_INTEGRATION_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioLwcAndApexWithCache() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.LWC_AND_APEX_WITH_CACHE_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.LWC_AND_APEX_WITH_CACHE_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testScenarioComplex() {
		Test.startTest();
		String strDatetime = String.valueOf(Datetime.now());
		DemoScenariosController.generateScenario(DemoScenariosController.COMPLEX_SCENARIO_ID);
		Test.stopTest();
		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.COMPLEX_SCENARIO_ID, strDatetime);
		System.assertNotEquals(null, log);
	}

	@IsTest
	static void testGetLogAndTransaction() {
		String transactionId = DemoScenariosController.getTransactionId();
		System.assertNotEquals(null, transactionId);

		pharos__Log__c log = DemoScenariosController.getLog(DemoScenariosController.SIMPLE_APEX_TRIGGER_SCENARIO_ID, String.valueOf(Datetime.now()));
		System.assertEquals(null, log);
	}

	@IsTest
	static void testInvocableMethod() {
		Test.setMock(HttpCalloutMock.class, new ToolingApiMock());
		Test.startTest();
		DemoScenariosController.scenarioFlowIntegrationInvocable();
		Test.stopTest();
	}

	private class ToolingApiMock implements HttpCalloutMock {
		public HttpResponse respond(HttpRequest req) {
			HttpResponse res = new HttpResponse();
			res.setHeader('Content-Type', 'application/json');
			res.setBody('{"size":1, "totalSize":1, "done":true, "records":[{"Id":"001000000000001"}]}');
			res.setStatusCode(200);
			return res;
		}
	}

}