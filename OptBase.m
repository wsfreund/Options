classdef(Abstract) OptBase
%
% This class has the base structure for an option object
%

% - Creation Date: Tue, 01 Oct 2013 
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 

  methods
    function out = eq(in1,in2)
      out = Utils.compareProps(in1,in2);
    end

    function [out,idx] = sort(self)
      [~,~,idx] = unique(self); 
      [~,idx] = sort(idx);
      out = self(idx);
    end

    function [c,ia,ib] = unique(self)
      nOpts = numel(self);
      tempC = cell(2,nOpts);
      idxCheckedMsk = false(1,nOpts);
      for curOptIdx = 1:nOpts
        if idxCheckedMsk(curOptIdx)
          continue;
        end
        curOpt = self(curOptIdx);
        equalMsk = self == curOpt;
        idxCheckedMsk = idxCheckedMsk | equalMsk;
        tempC{1,curOptIdx} = curOpt;
        tempC{2,curOptIdx} = equalMsk;
      end
      c = Utils.expandCell(tempC(1,:));
      if nargout > 1
        ia = find(~cellfun('isempty',tempC(2,:)));
        if nargout  > 2
          ib(nOpts) = 0;
          nC = numel(c);
          for curC = 1:nC
            ib(tempC{2,ia(curC)}) = curC;
          end
        end
      end
    end

    function out = ne(in1,in2)
      out = ~Utils.compareProps(in1,in2);
    end

    function self = overwriteDefault(self,opts,field,value)
      if ~isfield(opts,field)
        self.(field) = value;
      end
    end

  end

end

