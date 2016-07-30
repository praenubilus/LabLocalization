% three arguments for localization udp connection:
% 1. serever ip(the terminal which running the dashboard
% 2. udp listening port, this can be manualy configured in Dashboard Menu:
%       File -> Parameters. After setting the listening port, restart the
%       dashboard.
% 3. The address/ID of the mobile beacon, currently in our LAB the mobile
% beacon ID is 26. This can be configured in dashboard
clear;
% connection parameters
ip = '10.136.73.87';
port = 18888;
mobileBeaconId = 26;

% profiling parameters
rounds = 500;
count = rounds;
interval = 0.1;

% add python scripts folder to path, in the repository, the default
% location of the python scripts locates at '[project_root]/py_scripts'
PyPath = py.sys.path;
if count(PyPath,'../py_scripts') == 0
    insert(PyPath,int32(0),'../py_scripts');
end
% PyModule = py.sys.modules;
% if isa(PyModule.get('udpclient'),'py.NoneType')
%     py.importlib.import_module('udpclient');
% end

conn = py.udpclient.udp_factory(ip,uint16(port),uint16(mobileBeaconId));

duration = 0;

while count > 0
    tic;
    count = count - 1;
    coords = conn.request_position();
    duration = duration + toc;
    fprintf('%d, %d, %d\n',double(coords{1}), double(coords{2}), double(coords{3}));
    pause(interval);
end
    
fprintf('Average delay is:%f',duration/rounds);

conn.close();