const testAccounts = {
  "ft": {
    "login": "fda_ft@rosauto.ru",
    "password": "fdafdafda123",
  },
  "Stage": {
    "login": "fda_stage@rosauto.ru",
    "password": "fdafdafda123",
  }
};

const String prefix = '/sedd/api';

//user
const String login = '/api/login';
const String getUser = '/api/getUser';

//tasks
// const String getTaskForceSync = '/task/forceSync';
// const String getTask = '/task/';
// const String getTaskAttachments = '/task/{taskId}/attachments';
// const String getTaskSync = '/rest/task/sync';

//attachment
const String getIncomingDocumentById = '$prefix/IncomingDocument';
const String getOutgoingDocumentById = '$prefix/OutgoingDocument';
const String getAttachment = '$prefix/_file/rendition';

//REAL SEDD URLS....
const String inboxDataSource = '$prefix/InboxDataSource';
