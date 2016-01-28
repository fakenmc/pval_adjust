function pc = pval_adjust(p, method)
% PVAL_ADJUST Adjust p-values for multiple comparisons. Given a set of
% p-values, returns p-values adjusted using one of several methods. This is
% an implementation of the p.adjust R function, the documentation of which
% can be found at http://www.inside-r.org/r-doc/stats/p.adjust.
%
%   pc = PVAL_ADJUST(p, method)
%
% Parameters:
%        p - Numeric vector of p-values. Contrary to the R function, this
%            function does not handle NaNs.
%   method - Correction method, one of 'holm', 'hochberg', 'hommel', 
%            'bonferroni', 'BH', 'BY', 'fdr' or 'none'.
%
% Outputs:
%       pc - A numeric vector of corrected p-values, of the same length as
%            p.
%
% Copyright (c) 2016 Nuno Fachada
% Distributed under the MIT License (See accompanying file LICENSE or copy 
% at http://opensource.org/licenses/MIT)
%

% What method to use?
if strcmp(method, 'holm')
    
    % Number of p-values
    np = numel(p);
    
    % Sort p-values from smallest to largest
    [pc, pidx] = sort(p);
    
    % Adjust p-values
    for i = 1:np
        pc(i) = pc(i) * (np - i + 1);
    end;
    
    % Put p-values back in original positions
    pc(pidx) = pc;

elseif strcmp(method, 'hochberg')

    % Not implemented
    error('Method not implemented');

elseif strcmp(method, 'hommel')

    % Not implemented
    error('Method not implemented');

elseif strcmp(method, 'bonferroni')
    
    % Simple conservative Bonferroni
    pc = p * numel(p);
    
elseif strcmp(method, 'hochberg')

    % Not implemented
    error('Method not implemented');

elseif strcmp(method, 'BH') || strcmp(method, 'fdr')

    % Not implemented
    error('Method not implemented');

elseif strcmp(method, 'BY')

    % Not implemented
    error('Method not implemented');

elseif strcmp(method, 'none')
    
    % No correction
    pc = p;
    
else
    
    % Unknown method
    error('Unknown p-value adjustment method');
    
end;
    
% Can't have p-values larger than one
pc(pc > 1) = 1;    
    
